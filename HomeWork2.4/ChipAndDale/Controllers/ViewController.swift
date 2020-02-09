//
//  ViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 08.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var headerLabelCenterConstraint: NSLayoutConstraint!
    @IBOutlet var usernameTextFieldCenterConstraint: NSLayoutConstraint!
    @IBOutlet var passwordTextFieldCenterConstraint: NSLayoutConstraint!
    
    // MARK: - Lifecycle
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        headerLabelCenterConstraint.constant = 0
        
        UIView.animate(withDuration: 0.7) { [weak self] in
            self?.view.layoutIfNeeded()
        }
        
        usernameTextFieldCenterConstraint.constant = 0
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.4,
                       options: [],
                       animations: { [weak self] in
                        self?.view.layoutIfNeeded()
        }, completion: nil)
        
        passwordTextFieldCenterConstraint.constant = 0
        
        UIView.animate(withDuration: 0.7,
                       delay: 0.7,
                       options: [],
                       animations: { [weak self] in
                        self?.view.layoutIfNeeded()
        }, completion: nil)
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
    }
    
}

