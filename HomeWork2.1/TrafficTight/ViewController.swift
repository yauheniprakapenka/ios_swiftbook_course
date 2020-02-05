//
//  ViewController.swift
//  TrafficTight
//
//  Created by yauheni prakapenka on 29.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum TrafficLightColor {
        case red, yellow, green
    }
    
    // MARK: - IB Outlets
    @IBOutlet var redView: UIView!
    @IBOutlet var yellowView: UIView!
    @IBOutlet var greenView: UIView!
    
    @IBOutlet var startButton: UIButton!
    
    // MARK: - Private Properties
    private var currentTrafficLightColor         = TrafficLightColor.red
    private let activeColorAlpha: CGFloat        = 1.0
    private let inactiveColorAlpha: CGFloat      = 0.3
    
    // MARK: - Life Cycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    // MARK: - IB Actions
    @IBAction func startButtonTapped(_ sender: UIButton) {
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentTrafficLightColor {
        case .red:
            redView.alpha               = activeColorAlpha
            yellowView.alpha            = inactiveColorAlpha
            greenView.alpha             = inactiveColorAlpha
            currentTrafficLightColor    = .yellow
        case .yellow:
            redView.alpha               = inactiveColorAlpha
            yellowView.alpha            = activeColorAlpha
            greenView.alpha             = inactiveColorAlpha
            currentTrafficLightColor    = .green
        case .green:
            redView.alpha               = inactiveColorAlpha
            yellowView.alpha            = inactiveColorAlpha
            greenView.alpha             = activeColorAlpha
            currentTrafficLightColor    = .red
        }
    }
    
    // MARK: - Private Methods
    private func configureViews() {
        let views = [redView, yellowView, greenView]
        
        for view in views {
            view?.layer.cornerRadius    = (view?.bounds.width)! / 2
            view?.alpha                 = inactiveColorAlpha
        }
    }
}

