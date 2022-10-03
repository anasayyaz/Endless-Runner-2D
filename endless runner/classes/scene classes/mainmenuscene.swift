//
//  mainmenuscene.swift
//  endless runner
//
//  Created by Guest User on 7/18/18.
//  Copyright © 2018 ucp. All rights reserved.
//

import SpriteKit

class mainmenuscene: SKScene {

    
    
    
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches{
            let location = touch.location(in: self);
            
            if atPoint(location).name == "start"{
                // Load the SKScene from 'GameScene.sks'
                if let scene = gameplayscene(fileNamed: "gameplayscene") {
                    // Set the scale mode to scale to fit the window
                    scene.scaleMode = .aspectFill
                    
                    // Present the scene
                    view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)));
                    
                    
                }
            }
        }
    }
    
}
