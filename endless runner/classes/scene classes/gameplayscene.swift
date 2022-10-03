      //
//  gameplayscene.swift
//  endless runner
//
//  Created by Guest User on 7/11/18.
//  Copyright © 2018 ucp. All rights reserved.
//

import SpriteKit

class gameplayscene: SKScene ,SKPhysicsContactDelegate{
    
    
    
    private var bg1: bgclass?;
    private var bg2: bgclass?;
    private var bg3: bgclass?;
    
    
    
    private var ground1: groundclass?;
    private var ground2: groundclass?;
    private var ground3: groundclass?;
    
    
    private var floor1: groundclass?;
    private var floor2: groundclass?;
    private var floor3: groundclass?;
    
    
    private var player: Player?;
    private var maincamera: SKCameraNode?;
    
    private var scorelabel: SKLabelNode?;
    private var score = 0;
    
    private var Itemcontroller  =  itemcontroller();
    
    override func didMove(to view: SKView) {
        intializeGame();
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        manageCamera();
        managebgsandgrounds();
        player?.move();
        moverocket();
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        reversegravity();
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        var firstbody = SKPhysicsBody();
        var secondbody = SKPhysicsBody();
        
        if contact.bodyA.node?.name == "Player"{
            firstbody = contact.bodyA;
            secondbody = contact.bodyB;
        }
        else{
            firstbody = contact.bodyB;
            secondbody = contact.bodyA;
        }
        
        if firstbody.node?.name == "Player" && secondbody.node?.name == "coin"{
            score += 5;
            scorelabel?.text = String(score);
            secondbody.node?.removeFromParent();
        }
        
        if firstbody.node?.name == "Player" && secondbody.node?.name == "rocket" {
            firstbody.node?.removeFromParent();
            secondbody.node?.removeFromParent();
            
            Timer.scheduledTimer(timeInterval: TimeInterval(2), target: self, selector: #selector
                (gameplayscene.restartgame), userInfo: nil, repeats:
                false);
        }
    }
    
    private func intializeGame() {
        
        physicsWorld.contactDelegate = self;
        maincamera = childNode(withName: "maincamera") as?
            SKCameraNode!;
        
        bg1 = childNode(withName: "bg1") as? bgclass!;
        bg2 = childNode(withName: "bg2") as? bgclass!;
        bg3 = childNode(withName: "bg3") as? bgclass!;
    
    
        ground1 = childNode(withName: "ground1") as? groundclass!;
        ground2 = childNode(withName: "ground2") as? groundclass!;
        ground3 = childNode(withName: "ground3") as? groundclass!;
        
        ground1?.intializegroundandfloor();
        ground2?.intializegroundandfloor();
        ground3?.intializegroundandfloor();
        
        floor1 = childNode(withName: "floor1") as? groundclass!;
        floor2 = childNode(withName: "floor2") as? groundclass!;
        floor3 = childNode(withName: "floor3") as? groundclass!;
  
        
        
        floor1?.intializegroundandfloor();
        floor2?.intializegroundandfloor();
        floor3?.intializegroundandfloor();
        
        
        player = childNode(withName: "Player") as? Player!;
        player?.initializeplayer();
        
        scorelabel = maincamera!.childNode(withName: "scorelabel") as! SKLabelNode!;
      scorelabel?.text = "0";
        
        Timer.scheduledTimer(timeInterval: TimeInterval(Itemcontroller.randombetweennumbers(firstnum: 2, secondnum: 3)), target: self, selector: #selector
            (gameplayscene.spawnitems), userInfo: nil, repeats:
            true);
        
        
        Timer.scheduledTimer(timeInterval: TimeInterval(7), target: self, selector:
            #selector
                (gameplayscene.removeitems), userInfo: nil, repeats:
            true);
        
    }
    
    
    
    
    
    private func manageCamera(){
        self.maincamera?.position.x += 10;
    }
    

    
    private func managebgsandgrounds(){
        
        bg1?.movebg(camera: maincamera!);
        bg2?.movebg(camera: maincamera!);
        bg3?.movebg(camera: maincamera!);
        
        
        ground1?.movegroundorfloors(camera: maincamera!);
        ground2?.movegroundorfloors(camera: maincamera!);
        ground3?.movegroundorfloors(camera: maincamera!);
        
        
        
        floor1?.movegroundorfloors(camera: maincamera!);
        floor2?.movegroundorfloors(camera: maincamera!);
        floor3?.movegroundorfloors(camera: maincamera!);
    }
    
    private func reversegravity(){
        physicsWorld.gravity.dy *= -1;
        player?.reversePlayer();
    }
    
    
    @objc func spawnitems(){
        self.scene?.addChild(Itemcontroller.spawnitems(camera: maincamera!));
    }
    
    @objc func restartgame(){
        if let scene = gameplayscene(fileNamed: "gameplayscene") {
            // Set the scale mode to scale to fit the window
            scene.scaleMode = .aspectFill
            
            // Present the scene
            view!.presentScene(scene, transition: SKTransition.doorsOpenVertical(withDuration: TimeInterval(1)))
        }
    }
    
    private func moverocket(){
        enumerateChildNodes(withName: "rocket", using: ({
            (node,error) in
            node.position.x -= 5;
        }))
    }
    
    @objc func removeitems(){
        for child in children{
            if child.name == "coin" || child.name == "rocket"{
                if child.position.x < self.maincamera!.position.x - self.scene!.frame.width / 2{
                    child.removeFromParent();
                }
            }
        }
    }
}











