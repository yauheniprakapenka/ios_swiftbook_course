//
//  HomeViewController.swift
//  HW 2
//
//  Created by yauheni prakapenka on 15.02.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Private Properties
    
    private var homeVCColor: UIColor!
        
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingVC = segue.destination as! SettingViewController
        settingVC.delegate = self
        settingVC.backroundColor = view.backgroundColor
    }
}

// MARK: - Setting View Controller Delegate

extension HomeViewController: SettingViewControllerDelegate {
    func setBackgroundcolor(color: UIColor) {
        view.backgroundColor = color
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
