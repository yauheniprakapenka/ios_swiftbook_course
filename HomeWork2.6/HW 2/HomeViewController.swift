//
//  HomeViewController.swift
//  HW 2
//
//  Created by yauheni prakapenka on 15.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var backgroundView: UIView!
    
    private var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        color = backgroundView.backgroundColor
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingVC = segue.destination as! SettingViewController
        settingVC.color = color
    }
    
}
