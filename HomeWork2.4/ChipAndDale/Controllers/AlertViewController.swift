//
//  AlertViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 09.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var containerView: UIView!
    @IBOutlet var tipImageView: UIImageView!
    
    // MARK: - Public properties
    
    var currentTip: Tip?
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
        
        switch currentTip {
        case .name:
            tipImageView.image = #imageLiteral(resourceName: "NameTip")
        case .password:
            tipImageView.image = #imageLiteral(resourceName: "PasswordTip")
        case .wrong:
            tipImageView.image = #imageLiteral(resourceName: "WrongAnswer")
        case .none:
            break
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func buttonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
