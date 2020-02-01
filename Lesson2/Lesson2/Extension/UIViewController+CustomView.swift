//
//  UIViewController.swift
//  ColorView
//
//  Created by yauheni prakapenka on 01.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

extension UIViewController {
    func configLabel(label: UILabel, sliderValue: Float) -> UILabel {
        label.text = String(format: "%.2f", sliderValue)
        
        return label
    }
    
    func configTextField(textField: UITextField, sliderValue: Float) -> UITextField {
        textField.text          = String(format: "%.2f", sliderValue)
        textField.keyboardType  = .decimalPad
        textField.textAlignment = .right
        
        return textField
    }
    
    func configSlider(slider: UISlider, color: UIColor) -> UISlider {
        slider.minimumValue             = 0
        slider.maximumValue             = 1
        slider.value                    = 0.3
        slider.minimumTrackTintColor    = color
        
        return slider
    }
}
