//
//  SceneEditorViewController.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 30/11/2022.
//

import UIKit

import SwiftUI

struct SceneEditorView : UIViewControllerRepresentable {

    @Binding var project : Project

    typealias UIViewControllerType = SceneEditorViewController
    
    func makeUIViewController(context: Context) -> SceneEditorViewController {
        print("make")
        
        let storyboard  = UIStoryboard(name: "Main", bundle: .main)
        let viewController = storyboard.instantiateViewController(withIdentifier: "SceneEditor") as! SceneEditorViewController
        viewController.project = project
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: SceneEditorViewController, context: Context) {
        print("update")
    }
}

class SceneEditorViewController : UIViewController, UIScrollViewDelegate, UIGestureRecognizerDelegate {
    
    var project : Project!
    
    @IBOutlet var editorScrollView : UIScrollView!
    @IBOutlet var editorContent : UIView!
    
    var gameSceneViews : [GameSceneView] = []
    
    override func loadView() {
        super.loadView()
        //self.view.backgroundColor = .lightGray
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.editorScrollView.delegate = self
        

        self.editorScrollView.contentSize = CGSize(width: 2048, height: 2048)
        self.editorContent.frame = CGRect(x: 0, y: 0, width: 2048, height: 2048)
        
        for scene in project.scenes {
            self.makeGameSceneView(for: scene)
        }

        self.editorScrollView.contentSize = project.contentAreaSize
        self.editorContent.frame = CGRect(origin: .zero, size: project.contentAreaSize)
    }
    
    func makeGameSceneView(for scene : GameScene){
        let view = GameSceneView(frame: scene.viewFrame(for: CGSize(width: 8, height: 8))) //margin
        
        view.labelSceneName.text = scene.name
        view.backgroundImageView.image = project.getBackground(id: scene.backgroundId)
        view.identifier = scene.id
        
        view.makeCollision(for: scene.width, and: scene.height)
        
        self.editorContent.addSubview(view)
        self.gameSceneViews.append(view)
        
        
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(self.didRecognizeGesture(_:)))
        gesture.delegate = self
        view.labelSceneName.addGestureRecognizer(gesture)
        //view.addGestureRecognizer(gesture)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.didTapGesture(_:)))
        tapGesture.delegate = self
        view.addGestureRecognizer(tapGesture)
    }
    
//    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
//
//    }
//
//    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
//        return true
//    }
    
    func selectGameSceneView(_ gameSceneView : GameSceneView ) {
        for view in gameSceneViews {
            
            if gameSceneView.identifier == view.identifier {
                view.isSelected = true
            } else {
                view.isSelected = false
            }
            
        }
    }
    
    @objc func didTapGesture(_ recognizer : UITapGestureRecognizer){
        print("did tap")
        guard let gameSceneView = recognizer.view as? GameSceneView else {
            return
        }
        
        self.selectGameSceneView(gameSceneView)
    }
    
    @objc func didRecognizeGesture(_ recognizer : UIPanGestureRecognizer){
        let translation = recognizer.translation(in: self.editorContent)
        
        
        guard let gameSceneView = recognizer.view?.superview?.superview as? GameSceneView else {
            return
        }
        
        if recognizer.state == .began {
            self.selectGameSceneView(gameSceneView)
        }

        gameSceneView.center = CGPoint(
            x: gameSceneView.center.x + translation.x,
            y: gameSceneView.center.y + translation.y
        )

        recognizer.setTranslation(.zero, in: self.editorContent)

        
        
        
        //self.editorContent.frame = CGRect(origin: .zero, size: project.contentAreaSize)
        
        if recognizer.state == UIGestureRecognizer.State.ended {
            
            updateContentSize()
            self.editorScrollView.contentSize = project.contentAreaSize
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        updateContentSize()
    }
    
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return self.editorContent
    }
    
    func updateContentSize() {
        let scale = self.editorScrollView.zoomScale
        let resolvedSize = CGSize(width: project.contentAreaSize.width * scale , height: project.contentAreaSize.height * scale)
        self.editorContent.frame = CGRect(origin: .zero, size: resolvedSize)
    }
}
