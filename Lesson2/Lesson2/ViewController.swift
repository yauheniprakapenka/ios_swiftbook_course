//
//  ViewController.swift
//  Lesson2
//
//  Created by yauheni prakapenka on 30.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var changeableColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSliders()
    }
    
    private func configSliders() {
        redSlider.minimumValue              = 0
        redSlider.maximumValue              = 1
        redSlider.value                     = 1
        redSlider.minimumTrackTintColor     = .red
        
        greenSlider.minimumValue            = 0
        greenSlider.maximumValue            = 1
        greenSlider.value                   = 1
        greenSlider.minimumTrackTintColor   = .green
        
        blueSlider.minimumValue             = 0
        blueSlider.maximumValue             = 1
        blueSlider.value                    = 1
        blueSlider.minimumTrackTintColor    = .blue
    }
}
