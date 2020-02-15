//
//  HomeViewController.swift
//  HW 2
//
//  Created by yauheni prakapenka on 15.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet var backgroundView: UIView!
    
    // MARK: - Private Properties
    
    private var homeVCColor: UIColor!
    
    // MARK: - View Controller Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeVCColor = backgroundView.backgroundColor
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingVC = segue.destination as! SettingViewController
        settingVC.delegate = self
        settingVC.redColor = homeVCColor.components.red
        settingVC.blueColor = homeVCColor.components.blue
        settingVC.greenColor = homeVCColor.components.green
    }
}

// MARK: - Setting View Controller Delegate

extension HomeViewController: SettingViewControllerDelegate {
    func setBackgroundcolor(color: UIColor) {
        backgroundView.backgroundColor = color
        homeVCColor = color
    }
}

// MARK: - UIColor 

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
