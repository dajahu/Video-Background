//
//  ViewController.swift
//  PainSupport
//
//  Created by David Hultgren on 2016-03-01.
//  Copyright © 2016 The PainSquad. All rights reserved.
//


import UIKit
import AVKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the video from the app bundle.
        let videoURL: NSURL = NSBundle.mainBundle().URLForResource("video", withExtension: "mp4")!
        
        player = AVPlayer(URL: videoURL)
        player?.actionAtItemEnd = .None
        player?.muted = true
        
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = AVLayerVideoGravityResizeAspectFill
        playerLayer.zPosition = -1
        
        playerLayer.frame = view.frame
        
        view.layer.addSublayer(playerLayer)
        
        player?.play()
        
        //loop video
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "loopVideo",
            name: AVPlayerItemDidPlayToEndTimeNotification,
            object: nil)
    }
    
    func loopVideo() {
        player?.seekToTime(kCMTimeZero)
        player?.play()
    }
    
}

