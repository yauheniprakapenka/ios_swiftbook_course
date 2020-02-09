//
//  ViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 08.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController, CAAnimationDelegate {
    
    // MARK: - IBOutlets
    
    @IBOutlet var cloud1ImageView: UIImageView!
    @IBOutlet var cloud2ImageView: UIImageView!
    @IBOutlet var cloud3ImageView: UIImageView!
    @IBOutlet var cloud4ImageView: UIImageView!
    @IBOutlet var sunImageView: UIImageView!
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var headerLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet var usernameTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet var loginButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet var sunImageViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateClouds()
        makeAnimateSun()
        
        sunImageViewHeightConstraint.constant = -85
        makeAnimateLayout(duration: 3.3, delay: 0)
        
        headerLabelCenterConstraint.constant = 0
        makeAnimateLayout(duration: 0.7, delay: 3)
        
        usernameTextFieldCenterConstraint.constant = 0
        makeAnimateLayout(duration: 0.7, delay: 3.4)
        
        passwordTextFieldCenterConstraint.constant = 0
        makeAnimateLayout(duration: 0.7, delay: 3.8)
        
        UIView.animate(withDuration: 3, delay: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.backgroundView.backgroundColor = #colorLiteral(red: 0.6485911608, green: 0.790573597, blue: 0.9224731922, alpha: 1)
        })
        
        loginButtonHeightConstraint.constant = 40
        makeAnimateLayout(duration: 1.6, delay: 3.3)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.makeDissmissKeyboardTap()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        headerLabelCenterConstraint.constant -= view.bounds.width
        usernameTextFieldCenterConstraint.constant -= view.bounds.width
        passwordTextFieldCenterConstraint.constant -= view.bounds.width
        loginButtonHeightConstraint.constant += view.bounds.height
        sunImageViewHeightConstraint.constant += view.bounds.height
    }
    
    // MARK: - Private Methods
    
    private func animateClouds() {
        makeCloudAnimation(view: cloud1ImageView, duration: 2.8, value: 1.16)
        makeCloudAnimation(view: cloud2ImageView, duration: 3.0, value: 1.28)
        makeCloudAnimation(view: cloud3ImageView, duration: 2.4, value: 1.15)
        makeCloudAnimation(view: cloud4ImageView, duration: 3.2, value: 1.23)
    }
}

// MARK: - Cloud Animation

private extension ViewController {
    
    func makeCloudAnimation(view: UIView, duration: Double, value: CGFloat) {
        
        let options: UIView.AnimationOptions = [.curveEaseInOut, .repeat, .autoreverse]
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            view.frame.size.height *= value
            view.frame.size.width *= value
        }, completion: nil)
    }
}

// MARK: - Sun Animation

private extension ViewController {
    
    func makeAnimateSun() {
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.delegate = self
        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 15
        fullRotation.repeatCount = .infinity
        sunImageView.layer.add(fullRotation, forKey: "360")
    }
}

// MARK: - Layout Animation

private extension ViewController {
    
    func makeAnimateLayout(duration: Double, delay: Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut], animations: { [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
}

