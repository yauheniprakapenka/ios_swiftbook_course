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

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        containerView.layer.cornerRadius = 16
        containerView.clipsToBounds = true
    }
    
    // MARK: - IBAction
    
    @IBAction func buttonTapped(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
}
