//
//  MSPlayPauseToggleButtonNode.swift
//  Grid-Simulations
//
//  Created by Dion Larson on 6/5/16.
//  Copyright © 2016 Make School. All rights reserved.
//

import SpriteKit

public class MSPlayPauseToggleButtonNode: MSButtonNode {
    
    internal var toggled: Bool = false {
        didSet {
            if toggled {
                label.text = onText
            } else {
                label.text = offText
            }
        }
    }
    let offText = "Play"
    let onText = "Pause"
    let label = SKLabelNode()
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        label.text = offText
        label.position = CGPoint(x: 0, y: 4)
        label.fontName = "Menlo Bold"
        label.fontSize = 32
        label.fontColor = SKColor(red: 0, green: 43.0/255, blue: 62.0/255, alpha: 1.0)
        label.verticalAlignmentMode = .Center
        label.horizontalAlignmentMode = .Center
        self.addChild(label)
    }
    
    override public func mouseUp(theEvent: NSEvent) {
        toggled = !toggled
        super.mouseUp(theEvent)
    }
    
}