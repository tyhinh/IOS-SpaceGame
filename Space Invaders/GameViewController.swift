//
//  GameViewController.swift
//  Space Invaders
//
//  Created by Phan Thanh Nhan on 6/29/20.
//  Copyright © 2020 Phan Thanh Nhan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import AVFoundation

class GameViewController: UIViewController {
    
    var backingAudio = AVAudioPlayer()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Am thanh
        let filePath = Bundle.main.path(forResource: "Superboy", ofType: "mp3")
        let audioNSURL = NSURL(fileURLWithPath: filePath!)
        
        do
        {
            backingAudio = try AVAudioPlayer(contentsOf: audioNSURL as URL)
        }
        catch
        {
            return print ("Cannot find audio file")
        }
        
        backingAudio.numberOfLoops = -1
        backingAudio.play()
        
        
        if let view = self.view as! SKView? {
            
            // Load the SKScene from 'GameScene.sks'
            let scene = MainMenuScene(size: CGSize(width: 1536, height: 2048))
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
            
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = false
            view.showsNodeCount = false
        }
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
