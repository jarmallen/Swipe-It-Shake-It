//
//  ViewController.swift
//  Swipe It Shake It
//
//  Created by Jared Allen on 5/6/16.
//  Copyright © 2016 Jared Allen. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer = AVAudioPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
    
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeLeft)
        
        let swipeUp = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeUp.direction = UISwipeGestureRecognizerDirection.Up
        self.view.addGestureRecognizer(swipeUp)
        
        let swipeDown = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swiped(_:)))
        swipeDown.direction = UISwipeGestureRecognizerDirection.Down
        self.view.addGestureRecognizer(swipeDown)

    }
    
    func swiped(gesture: UISwipeGestureRecognizer){
        
        var audioFilePath = String()
        
        if let swipeGesture: UISwipeGestureRecognizer = gesture {
            
            switch swipeGesture.direction {
                
            case UISwipeGestureRecognizerDirection.Right: audioFilePath = NSBundle.mainBundle().pathForResource("quick_buzzer_like_a_game_show_wrong_answer_", ofType: "mp3")!
                
            case UISwipeGestureRecognizerDirection.Left: audioFilePath = NSBundle.mainBundle().pathForResource("boing_comical_accent", ofType: "mp3")!
                
            case UISwipeGestureRecognizerDirection.Up: audioFilePath = NSBundle.mainBundle().pathForResource("comedy_accent_crash_and_burn", ofType: "mp3")!
                
            case UISwipeGestureRecognizerDirection.Down: audioFilePath = NSBundle.mainBundle().pathForResource("comedy_zips_pops_and_bonks", ofType: "mp3")!
                
            default:
                break
            }
        }
        
        do {
            
            try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioFilePath))
            
            player.play()
            
        } catch {
            
            // Process error here
            
        }
    }
    
        override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent?) {
            if event?.subtype == UIEventSubtype.MotionShake {
                
                let audioFilePath = NSBundle.mainBundle().pathForResource("comedy_male_yelling_yee_ha", ofType: "mp3")!
                
                do {
                    
                    try player = AVAudioPlayer(contentsOfURL: NSURL(fileURLWithPath: audioFilePath))
                    
                    player.play()
                    
                } catch {
                    
                    // Process error here
                    
                }
                
                
            }
        }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

