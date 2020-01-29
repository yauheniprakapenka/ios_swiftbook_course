//
//  ViewController.swift
//  TrafficTight
//
//  Created by yauheni prakapenka on 29.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum TrafficLightColor { case red, yellow, green }
    
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    private var currentTrafficLightColor    = TrafficLightColor.red
    private let activeColor: CGFloat        = 1.0
    private let inactiveColor: CGFloat      = 0.3
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentTrafficLightColor {
        case .red:
            redView.alpha       = activeColor
            yellowView.alpha    = inactiveColor
            greenView.alpha     = inactiveColor
            currentTrafficLightColor = .yellow
        case .yellow:
            redView.alpha       = inactiveColor
            yellowView.alpha    = activeColor
            greenView.alpha     = inactiveColor
            currentTrafficLightColor = .green
        case .green:
            redView.alpha       = inactiveColor
            yellowView.alpha    = inactiveColor
            greenView.alpha     = activeColor
            currentTrafficLightColor = .red
        }
    }
    
    private func configureViews() {
        redView.layer.cornerRadius      = redView.bounds.width / 2
        yellowView.layer.cornerRadius   = yellowView.bounds.width / 2
        greenView.layer.cornerRadius    = greenView.bounds.width / 2
        
        redView.alpha       = inactiveColor
        yellowView.alpha    = inactiveColor
        greenView.alpha     = inactiveColor
    }
}

