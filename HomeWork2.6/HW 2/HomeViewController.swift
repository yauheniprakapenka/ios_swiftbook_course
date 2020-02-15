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
    
    private var mainColor: UIColor!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainColor = backgroundView.backgroundColor
        
        let rgbColor = mainColor.components
        print("red \(rgbColor.red)")
        print("green \(rgbColor.green)")
        print("blue \(rgbColor.blue)")
        print("alpha \(rgbColor.alpha)")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let settingVC = segue.destination as! SettingViewController
        settingVC.delegate = self
        settingVC.color = mainColor
    }
}

extension HomeViewController: SettingViewControllerDelegate {
    func setBackgroundcolor(color: UIColor) {
        backgroundView.backgroundColor = color
        mainColor = color
    }
}

extension UIColor {
    var coreImageColor: CIColor {
        return CIColor(color: self)
    }
    var components: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        let coreImageColor = self.coreImageColor
        return (coreImageColor.red, coreImageColor.green, coreImageColor.blue, coreImageColor.alpha)
    }
}
