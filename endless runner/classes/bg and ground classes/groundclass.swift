//
//  groundclass.swift
//  endless runner
//
//  Created by Guest User on 7/11/18.
//  Copyright © 2018 ucp. All rights reserved.
//

import SpriteKit

class groundclass: SKSpriteNode{
   
    func intializegroundandfloor(){
        physicsBody = SKPhysicsBody(rectangleOf: self.size);
        physicsBody?.affectedByGravity = false;
        physicsBody?.isDynamic =  false;
        physicsBody?.categoryBitMask = collidertype.GROUND;
    }
    
    func movegroundorfloors(camera: SKCameraNode){
        if self.position.x + self.size.width < camera.position.x{
            self.position.x += self.size.width * 3;
        }
    }
}
