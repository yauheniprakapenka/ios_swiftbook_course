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
    
    // MARK: - IB Outlets
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
    
    @IBOutlet var colorView: UIView!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSliders()
        configLabels()
        congigTextFields()
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(redSlider.value), alpha: 1)
        
        makeDismissKeyboardTapGesture()
    }
    
    // MARK: - IB Actions
    
    @IBAction func valueSliderChanged(_ sender: UISlider) {
        let currentSliderValue = String(format: "%.2f", sender.value)
        
        let redOpacity      = CGFloat(redSlider.value)
        let greenOpacity    = CGFloat(greenSlider.value)
        let blueOpacity     = CGFloat(blueSlider.value)
        
        switch sender.accessibilityIdentifier {
        case SliderId.redSliderID.rawValue:
            redLabel.text           = currentSliderValue
            redTextField.text       = currentSliderValue
        case SliderId.greenSliderID.rawValue:
            greenLabel.text         = currentSliderValue
            greenTextField.text     = currentSliderValue
        case SliderId.blueSliderID.rawValue:
            blueLabel.text          = currentSliderValue
            blueTextField.text      = currentSliderValue
        default:
            print("Error getting value from slider")
        }
        
        colorView.backgroundColor = UIColor(red: redOpacity, green: greenOpacity, blue: blueOpacity, alpha: 1)
    }
    
    // MARK: - Private methods
    
    private func makeDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
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
        
        redTextField.clearButtonMode    = .always
        greenTextField.clearButtonMode  = .always
        blueTextField.clearButtonMode   = .always
        
        redTextField.inputAccessoryView     = makeToolbarOnKeyboard()
        greenTextField.inputAccessoryView   = makeToolbarOnKeyboard()
        blueTextField.inputAccessoryView    = makeToolbarOnKeyboard()
    }
}

// MARK: - Add Done button on Keyboard

extension ViewController {
    
    private func makeToolbarOnKeyboard() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.width, height: 30)))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))

        toolbar.setItems([flexSpace, doneButton], animated: false)
        toolbar.sizeToFit()

        return toolbar
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
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider!.value), green: CGFloat(greenSlider!.value), blue: CGFloat(blueSlider!.value), alpha: 1)
        
        view.endEditing(true)
    }
}
