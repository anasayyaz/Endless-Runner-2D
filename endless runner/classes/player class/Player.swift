//
//  player.swift
//  endless runner
//
//  Created by Guest User on 7/11/18.
//  Copyright © 2018 ucp. All rights reserved.
//

import SpriteKit

struct collidertype{
    static let PLAYER: UInt32 = 0;
    static let GROUND: UInt32 = 1;
    static let ROCKET_AND_COLLECTABLES: UInt32 = 2
    
}
class  Player: SKSpriteNode {
    

    private var playeranimation = [SKTexture]();
    private var animateplayeraction = SKAction();
    
    func initializeplayer(){
     //   name = "Player";
        
     //
        
       // let name = "Player \(i)";
      
            playeranimation.append(SKTexture(imageNamed: "Player1"));
        //}
        animateplayeraction = SKAction.animate(with: playeranimation, timePerFrame: 0.08, resize: true, restore: false);
        
        self.run(SKAction.repeatForever(animateplayeraction));
      
        physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: self.size.width - 20 , height: self.size.height))
        physicsBody?.affectedByGravity = true;
        physicsBody?.allowsRotation = false;
        physicsBody?.restitution = 0.05;
        physicsBody?.categoryBitMask = collidertype.PLAYER;
        physicsBody?.collisionBitMask = collidertype.GROUND;
        physicsBody?.contactTestBitMask = collidertype.ROCKET_AND_COLLECTABLES;
        
        
        
    }
    
    func move(){
        self.position.x += 10;
    }
    
    func reversePlayer(){
        self.yScale *= -1;
        
    }
}
