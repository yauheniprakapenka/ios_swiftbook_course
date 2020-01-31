//
//  ViewController.swift
//  Lesson2
//
//  Created by yauheni prakapenka on 30.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum SliderId: String {
        case redSliderID
        case greenSliderID
        case blueSliderID
    }
    
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
        configLabels()
        congigTextFields()
        
        changeableColorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(redSlider.value), alpha: 1)
    }
    
    @IBAction func valueSliderChanged(_ sender: UISlider) {
        let currentSliderValue = String(format: "%.2f", sender.value)
        
        var redOpacity      = CGFloat(redSlider.value)
        var greenOpacity    = CGFloat(greenSlider.value)
        var blueOpacity     = CGFloat(blueSlider.value)
        
        switch sender.accessibilityIdentifier {
        case SliderId.redSliderID.rawValue:
            redLabel.text           = currentSliderValue
            redTextField.text       = currentSliderValue
            redOpacity              = CGFloat(sender.value)
            
        case SliderId.greenSliderID.rawValue:
            greenLabel.text         = currentSliderValue
            greenTextField.text     = currentSliderValue
            greenOpacity            = CGFloat(sender.value)
            
        case SliderId.blueSliderID.rawValue:
            blueLabel.text          = currentSliderValue
            blueTextField.text      = currentSliderValue
            blueOpacity             = CGFloat(sender.value)
            
        default:
            print("Error getting value from slider")
        }
        
        changeableColorView.backgroundColor = UIColor(red: redOpacity, green: greenOpacity, blue: blueOpacity, alpha: 1)
    }
}

// MARK: - Setup UI

extension ViewController {

    private func configSliders() {
        redSlider.minimumValue              = 0
        redSlider.maximumValue              = 1
        redSlider.value                     = 0.5
        redSlider.minimumTrackTintColor     = .red
        redSlider.accessibilityIdentifier   = SliderId.redSliderID.rawValue
        
        greenSlider.minimumValue            = 0
        greenSlider.maximumValue            = 1
        greenSlider.value                   = 0.5
        greenSlider.minimumTrackTintColor   = .green
        greenSlider.accessibilityIdentifier = SliderId.greenSliderID.rawValue
        
        blueSlider.minimumValue             = 0
        blueSlider.maximumValue             = 1
        blueSlider.value                    = 0.5
        blueSlider.minimumTrackTintColor    = .blue
        blueSlider.accessibilityIdentifier  = SliderId.blueSliderID.rawValue
    }
    
    private func configLabels() {
        redLabel.text       = String(format: "%.2f", redSlider.value)
        greenLabel.text     = String(format: "%.2f", greenSlider.value)
        blueLabel.text      = String(format: "%.2f", blueSlider.value)
    }
    
    private func congigTextFields() {
        redTextField.text   = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text  = String(format: "%.2f", blueSlider.value)
        
        redTextField.keyboardType       = .decimalPad
        greenTextField.keyboardType     = .decimalPad
        blueTextField.keyboardType      = .decimalPad
        
        addDoneButtonOnDecimalPad()
    }
}

// MARK: - Add Done button on decimal pad

extension ViewController {
    
    private func addDoneButtonOnDecimalPad() {
        let toolbar = UIToolbar(frame: CGRect.init())

        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))

        var items = [UIBarButtonItem]()
        items.append(flexSpace)
        items.append(doneButton)

        toolbar.items = items
        toolbar.sizeToFit()

        redTextField.inputAccessoryView     = toolbar
        greenTextField.inputAccessoryView   = toolbar
        blueTextField.inputAccessoryView    = toolbar
    }
    
    @objc private func doneButtonTapped(_ sender: UIButton) {
        redSlider.value     = Float(Double(redTextField.text!)!)
        greenSlider.value   = Float(Double(greenTextField.text!)!)
        blueSlider.value    = Float(Double(blueTextField.text!)!)
        
        redLabel.text       = String(format: "%.2f", redSlider.value)
        greenLabel.text     = String(format: "%.2f", greenSlider.value)
        blueLabel.text      = String(format: "%.2f", blueSlider.value)
        
        redTextField.text   = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text  = String(format: "%.2f", blueSlider.value)
        
        redTextField.resignFirstResponder()
        greenTextField.resignFirstResponder()
        blueTextField.resignFirstResponder()
        
        changeableColorView.backgroundColor = UIColor(red: CGFloat(redSlider!.value), green: CGFloat(greenSlider!.value), blue: CGFloat(blueSlider!.value), alpha: 1)
    }
}
