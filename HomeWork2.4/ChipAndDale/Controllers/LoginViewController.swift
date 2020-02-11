//
//  ViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 08.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit
import QuartzCore // Для поворота вью на 360

class LoginViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var cloud1ImageView: UIImageView!
    @IBOutlet var cloud2ImageView: UIImageView!
    @IBOutlet var cloud3ImageView: UIImageView!
    @IBOutlet var cloud4ImageView: UIImageView!
    @IBOutlet var sunImageView: UIImageView!
    
    @IBOutlet var backgroundView: UIView!
    
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    @IBOutlet var headerLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet var usernameTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet var loginButtonHeightConstraint: NSLayoutConstraint!
    @IBOutlet var sunImageViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - View Controller Lifecycle
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        headerLabelCenterConstraint.constant -= view.bounds.width
        usernameTextFieldCenterConstraint.constant -= view.bounds.width
        passwordTextFieldCenterConstraint.constant -= view.bounds.width
        loginButtonHeightConstraint.constant += view.bounds.height
        sunImageViewHeightConstraint.constant += view.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        animateClouds()
        animateSun()
        animateBackground()
        animateLayouts()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginButton.layer.cornerRadius = 16
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let tabbarController = segue.destination as! UITabBarController
        let vc = tabbarController.viewControllers?.first as! ChipViewController
        vc.header = "\(usernameTextField.text!) \(passwordTextField.text!)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    // MARK: - IBAction
    
    @IBAction func loginButtonTapped(_ sender: UIButton) {
        
        view.endEditing(true)
        
        guard let username = usernameTextField.text, let password = passwordTextField.text,
            !username.isEmpty && !password.isEmpty else {
                presentAlertVC(tip: .wrong)
                usernameTextField.text = ""
                passwordTextField.text = ""
                return
        }
        
        let user = User()
        
        guard usernameTextField.text!.lowercased() == user.name && passwordTextField.text!.lowercased() == user.password else {
            presentAlertVC(tip: .wrong)
            usernameTextField.text = ""
            passwordTextField.text = ""
            return
        }
    }
    
    @IBAction func forgetNameButtonTapped(_ sender: Any) {
        presentAlertVC(tip: .name)
    }
    
    @IBAction func forgetPasswordTapped(_ sender: Any) {
        presentAlertVC(tip: .password)
    }
    
    @IBAction func unwindSeque(segue: UIStoryboardSegue) {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
    
    // MARK: - Private Methods
    
    private func animateClouds() {
        animateCloud(view: cloud1ImageView, duration: 2.8, value: 1.16)
        animateCloud(view: cloud2ImageView, duration: 3.0, value: 1.28)
        animateCloud(view: cloud3ImageView, duration: 2.4, value: 1.15)
        animateCloud(view: cloud4ImageView, duration: 3.2, value: 1.23)
    }
    
    private func animateLayouts() {
        sunImageViewHeightConstraint.constant = -85
        animateLayout(duration: 3.3, delay: 0)
        
        headerLabelCenterConstraint.constant = 0
        animateLayout(duration: 0.9, delay: 3)
        
        usernameTextFieldCenterConstraint.constant = 0
        animateLayout(duration: 0.9, delay: 3.4)
        
        passwordTextFieldCenterConstraint.constant = 0
        animateLayout(duration: 0.9, delay: 3.8)
        
        loginButtonHeightConstraint.constant = 40
        animateLayout(duration: 1.9, delay: 4.0)
    }
    
    private func presentAlertVC(tip: Tip) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateViewController(identifier: "AlertVC") as? AlertViewController else { return }
        
        vc.modalPresentationStyle = .overCurrentContext
        vc.modalTransitionStyle = .crossDissolve
        vc.currentTip = tip
        
        present(vc, animated: false)
    }
}

// MARK: - Animation

private extension LoginViewController {
    
    func animateCloud(view: UIView, duration: Double, value: CGFloat) {
        let options: UIView.AnimationOptions = [.curveEaseInOut, .repeat, .autoreverse]
        
        UIView.animate(withDuration: duration, delay: 0, options: options, animations: {
            view.frame.size.height *= value
            view.frame.size.width *= value
        }, completion: nil)
    }
    
    func animateLayout(duration: Double, delay: Double) {
        UIView.animate(withDuration: duration, delay: delay, options: [.curveEaseInOut], animations: { [weak self] in
            self?.view.layoutIfNeeded()
        })
    }
    
    func animateBackground() {
        UIView.animate(withDuration: 3, delay: 1, options: .curveEaseInOut, animations: { [weak self] in
            self?.backgroundView.backgroundColor = #colorLiteral(red: 0.6485911608, green: 0.790573597, blue: 0.9224731922, alpha: 1)
        })
    }
}

// MARK: - CA Animation Delegate

extension LoginViewController: CAAnimationDelegate {
    
    func animateSun() {
        let fullRotation = CABasicAnimation(keyPath: "transform.rotation")
        fullRotation.delegate = self
        fullRotation.fromValue = NSNumber(floatLiteral: 0)
        fullRotation.toValue = NSNumber(floatLiteral: Double(CGFloat.pi * 2))
        fullRotation.duration = 15
        fullRotation.repeatCount = .infinity
        sunImageView.layer.add(fullRotation, forKey: "360")
    }
}
