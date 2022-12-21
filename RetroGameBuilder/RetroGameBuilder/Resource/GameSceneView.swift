//
//  GameSceneView.swift
//  RetroGameBuilder
//
//  Created by Yu Ho Kwok on 30/11/2022.
//

import UIKit

class GameSceneView : UIView {
    let kCONTENT_XIB_NAME = "GameSceneView"
    
    let tileSize = CGSize(width: 8, height: 8)
    
    var identifier = ""
    var isSelected = false {
        didSet {
            self.backgroundColor = isSelected ? UIColor(white: 0, alpha: 0.1) : .clear
        }
    }
    
    @IBOutlet var contentView : UIView!
    @IBOutlet var backgroundImageView : UIImageView!
    @IBOutlet var collisionsContainer : UIView!
    @IBOutlet var labelSceneName : UILabel!
    @IBOutlet var infoLabel : UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed(kCONTENT_XIB_NAME, owner: self, options: nil)
        contentView.fixInView(self)
        contentView.backgroundColor = .clear
        self.backgroundColor = .clear
        
        self.layer.shouldRasterize = false
        self.backgroundImageView.layer.shouldRasterize = false
        self.backgroundImageView.layer.magnificationFilter = .nearest
        self.backgroundImageView.layer.minificationFilter = .nearest
    }
    
    func makeCollision(for width : Int, and height : Int){
        let total = width * height
        for i in 0..<total {
            let row = i / width
            let column = i % width
            let x = CGFloat(column) * tileSize.width
            let y = CGFloat(row) * tileSize.height
            let view = UIView(frame: CGRect(origin: CGPoint(x: x, y: y), size: tileSize))
            if column % 2 == 0 {
                view.backgroundColor = UIColor(white: 0, alpha: 0.1)
            } else {
                view.backgroundColor = UIColor(white: 0, alpha: 0.3)
            }
            view.tag = i
            view.isUserInteractionEnabled = false
            self.collisionsContainer.addSubview(view)
        }
    }
        
}

extension UIView {
    func fixInView(_ container: UIView!) -> Void{
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.frame = container.frame;
        container.addSubview(self);
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
        
    }
}
