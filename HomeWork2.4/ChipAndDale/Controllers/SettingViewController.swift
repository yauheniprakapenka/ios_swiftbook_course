//
//  SettingViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 10.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class SettingViewController: UIViewController {
    
    // MARK: - IBOutlet
    
    @IBOutlet var exitButton: UIButton!
    @IBOutlet var videoView: UIView!
    @IBOutlet var playButton: UIButton!
    
    // MARK: - Private Properties
    
    private var player: AVPlayer!
    private var firstStart = true
    private var isPlaying = true
    
    // MARK: - View Controller Lyfecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        exitButton.layer.cornerRadius = 16
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if firstStart {
            firstStart = false
            
            playVideo()
            
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { [weak self] _ in
                self?.player?.seek(to: CMTime.zero)
                self?.player?.play()
            }
        }
    }
    
    // MARK: - iBAction
    
    @IBAction func playPauseBauttonTapped(_ sender: Any) {
        
        if isPlaying {
            player.pause()
            playButton.setTitle("Play", for: .normal)
        } else {
            player.play()
            playButton.setTitle("Pause", for: .normal)
        }
        
        isPlaying = !isPlaying
    }
    
    
    // MARK: - Private methods
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "Intro2", ofType:"mp4") else {
            print("Error: video not found")
            return
        }
        
        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = videoView.bounds
        
        videoView.layer.addSublayer(playerLayer)
        player.play()
    }
}
