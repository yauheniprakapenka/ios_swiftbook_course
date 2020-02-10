//
//  ChipViewController.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 09.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ChipViewController: UIViewController {
    
    // MARK: - IBAction
    
    @IBOutlet var headerLabel: UILabel!
    
    // MARK: - Puclic properties
    
    var header = ""
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        headerLabel.text = "Привет, \(header)!"
    }
}
