//
//  item controller.swift
//  endless runner
//
//  Created by Guest User on 7/12/18.
//  Copyright © 2018 ucp. All rights reserved.
//

import SpriteKit



class itemcontroller{
    
    
    private var miny = CGFloat(-270), maxy = CGFloat(270);
    
    
    func spawnitems(camera: SKCameraNode) -> SKSpriteNode{
        
        let item: SKSpriteNode?;
        
        if Int(randombetweennumbers(firstnum: 0, secondnum: 10)) >= 6 {
            item = SKSpriteNode(imageNamed: "rocket");
            item?.name = "rocket";
            item?.setScale(0.7);
            item?.physicsBody = SKPhysicsBody(rectangleOf: item!.size);
            
        }
        else{
            item = SKSpriteNode(imageNamed: "coin");
            item?.name = "coin";
            item?.physicsBody = SKPhysicsBody(circleOfRadius: item!.size.height / 2)
        }
        
        item!.physicsBody?.affectedByGravity = false;
        item?.physicsBody?.categoryBitMask = collidertype.ROCKET_AND_COLLECTABLES;
        
        item?.zPosition = 4;
        item?.anchorPoint = CGPoint(x: 0.5, y: 0.5);
        
        item?.position.x = camera.position.x + 900;
        item?.position.y = randombetweennumbers(firstnum: miny, secondnum: maxy);
        
        return item!;
    }
    func randombetweennumbers(firstnum: CGFloat, secondnum: CGFloat)
        ->CGFloat{
        return CGFloat(arc4random()) / CGFloat(UINT32_MAX) * abs (firstnum - secondnum) + min(firstnum, secondnum);
    }
    
}
