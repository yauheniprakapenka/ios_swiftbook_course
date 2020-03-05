//
//  AlertViewController.swift
//  NewProject
//
//  Created by yauheni prakapenka on 01.03.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {
    
    @IBOutlet var errorLabel: UILabel!
    
    var currentError: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorLabel.text = currentError
    }
    
}
