//
//  Project.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 17/11/2022.
//

import Foundation
import UIKit

struct Project : Codable, Identifiable {
    var id = UUID().uuidString
    
    //basic parameter of the object
    var name : String
    var author : String
    var version : String
    var release : String
    
    var scenes : [GameScene] = []
    
    var variables : [Variable] = []
    
    var scripts : [Script] = []
    
    var backgrounds : [Background] = []
    
    init(){
        self.name = "Test"
        self.author = "Test Author"
        self.version = "0.0.1"
        self.release = "1"
    }
    
    var contentAreaSize : CGSize {
        
        var maxX : CGFloat = 0;
        var maxY : CGFloat = 0;
        
        for scene in scenes {
            let frame = scene.viewFrame(for: CGSize(width: 8, height: 8))
            maxX = maxX > frame.origin.x + frame.size.width ? maxX : frame.origin.x + frame.size.width
            maxY = maxY > frame.origin.y + frame.size.height ? maxY : frame.origin.y + frame.size.height
        }
        return CGSize(width: maxX + 30, height: maxY + 30)
    }
    
    
    static var _sampleProject : Project!
    
    
    static var sampleProject : Project {
        if _sampleProject == nil {
            var project = Project()
            let margin = 30
            
            var scene = GameScene()

            scene = GameScene()
            scene.x = 141
            scene.y =  75
            scene.width = 20
            scene.height = 18
            scene.name = "Logo"
            scene.backgroundId = "f8b1c7ad-7bb2-44b2-8189-175ae8698f11"
            project.scenes.append(scene)
            
            scene = GameScene()
            scene.x = 140
            scene.y =  289
            scene.width = 20
            scene.height = 18
            scene.name = "Menu Page 1"
            scene.backgroundId = "93d8839f-c19c-4eb2-a386-b0bb77068521"
            project.scenes.append(scene)
            
            scene = GameScene()
            scene.x = 148
            scene.y =  526
            scene.width = 20
            scene.height = 18
            scene.name = "Player's House"
            scene.backgroundId = "0af9ba31-7864-4664-9603-b211dc0f3793"
            project.scenes.append(scene)

            scene = GameScene()
            scene.x = 338
            scene.y =  521
            scene.width = 80
            scene.height = 18
            scene.name = "Parallax Example"
            scene.backgroundId = "b48f4eda-5654-4760-b8a9-4fd3f7e7ed5e"
            project.scenes.append(scene)
            
            
            var background = Background()
            background.id = "f8b1c7ad-7bb2-44b2-8189-175ae8698f11"
            background.filename = "logo"
            project.backgrounds.append(background)
            
            
            background.id = "93d8839f-c19c-4eb2-a386-b0bb77068521"
            background.filename = "menu_page1"
            project.backgrounds.append(background)
            
            background.id = "0af9ba31-7864-4664-9603-b211dc0f3793"
            background.filename = "room"
            project.backgrounds.append(background)
            
            background.id = "b48f4eda-5654-4760-b8a9-4fd3f7e7ed5e"
            background.filename = "parallax"
            project.backgrounds.append(background)
            
            for _ in 0...5 {
                let script = Script()
                project.scripts.append(script)
            }
            
            for _ in 0...12 {
                let variable = Variable()
                project.variables.append(variable)
            }
            _sampleProject = project
        }
        return _sampleProject
    }
    
    func getBackground(id : String) -> UIImage? {
        for background in backgrounds {
            if background.id == id {
                return UIImage(named: background.filename)
            }
        }
        return nil
    }
    
}

struct GameScene  : Codable, Identifiable  {
    var id = UUID().uuidString
    var name : String = "test"
    var backgroundId : String = "test"
    var x : Double = 0
    var y : Double = 0
    var width : Int = 100
    var height : Int = 100
    
    var scripts : [Script] = []
    var actions : [Actor] = []
    var triggers : [Trigger] = []
    
    func viewFrame(for tileSize : CGSize) -> CGRect {
        let margin : CGFloat = 20
        let viewWidth = Double(width) * tileSize.width
        let viewHeight = Double(height) * tileSize.width
        return CGRect(origin: CGPoint(x: x, y: y), size: CGSize(width: viewWidth , height: viewHeight + margin * 2))
    }
}

struct Background : Codable, Identifiable {
    var id = UUID().uuidString
    var name = "Background"
    var width : Double = 20
    var height : Double = 20
    var imageWidth : Double = 160
    var imageHeight : Double = 144
    var filename : String = "abc.png"
    var tileColors : [Int] = []
}

struct Variable : Codable, Identifiable {
    var id : Int = 0
    var name : String = "Variable"
}

struct Script : Codable, Identifiable {
    var id = UUID().uuidString
    var name = "Script"
}

struct Actor : Codable, Identifiable {
    var id = UUID().uuidString
    var x : Double
    var y : Double
}


struct Trigger : Codable, Identifiable {
    var id = UUID().uuidString
    var x : Double
    var y : Double
}

struct Settings : Codable {
    var startX : Int
    var startY : Int
    var startSceneId : String
    
}

struct Model {
    private static let encoder =  JSONEncoder()
    private static let decoder = JSONDecoder()
    /// Copy and return any Codable Data Structure
    /// - Parameter anyCodable: any codable object
    /// - Returns: an identifical copy of the input
    static func copy<T : Codable>(_ anyCodable : T ) -> T? {
        do {
            let data = try encoder.encode(anyCodable)
            let identicalCopy = try decoder.decode(T.self, from: data)
            return identicalCopy
        } catch _ {
            return nil
        }
    }
}

