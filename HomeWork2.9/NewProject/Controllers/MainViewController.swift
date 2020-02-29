//
//  ViewController.swift
//  NewProject
//
//  Created by yauheni prakapenka on 21.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import Spring

class MainViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var animateSpringView: SpringView!
    @IBOutlet var animateButtonView: SpringButton!
    
    @IBOutlet var presetLabel: UILabel!
    @IBOutlet var curveLabel: UILabel!
    @IBOutlet var forceLabel: UILabel!
    @IBOutlet var durationLabel: SpringLabel!
    
    // MARK: - Private properties
    
    private var nextAnimation: String? {
        didSet {
            animateButtonView.setTitle(nextAnimation, for: .normal)
        }
    }
    
    // MARK: - View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        startAnimation()
    }
    
    // MARK: - IBAction
    
    @IBAction func startAnimationButtontapped(_ sender: UIButton) {
        startAnimation()
    }
    
    // MARK: - Private methods
    
    private func startAnimation() {
        makeSpringAnimation(view: animateSpringView)
        presetLabel.text = AnimationProperty.preset
        curveLabel.text = AnimationProperty.curve
        forceLabel.text = String(format: "force %.2f", AnimationProperty.force)
        durationLabel.text = String(format: "duration %.2f", AnimationProperty.duration)
        
        makeSpringAnimation(view: animateButtonView)
        makeSpringAnimation(view: durationLabel)
    }
    
    private func makeSpringAnimation(view: Springable) {
        
        if nextAnimation == nil {
            nextAnimation = getRandomAnimationPreset()
        }
        view.animation = nextAnimation!
        view.curve = getRandomAnimationCurve()
        view.force = CGFloat.random(in: 1...5)
        view.duration = CGFloat.random(in: 1...3)
        
        if view is UIView {
            AnimationProperty.preset = nextAnimation!
            AnimationProperty.curve = view.curve
            AnimationProperty.force = view.force
            AnimationProperty.duration = view.duration
        }
        
        view.animate()
        
        nextAnimation = getRandomAnimationPreset()
    }
    
    private func getRandomAnimationPreset() -> String {
        DataManager.getAnimationPreset().randomElement()?.rawValue ?? "slideLeft"
    }
    
    private func getRandomAnimationCurve() -> String {
        DataManager.getAnimationCurve().randomElement()?.rawValue ?? "easeIn"
    }
}
