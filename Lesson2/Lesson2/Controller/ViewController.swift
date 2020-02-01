//
//  ViewController.swift
//  Lesson2
//
//  Created by yauheni prakapenka on 30.01.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
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
        configSlider(slider: redSlider, color: .red)
        configSlider(slider: greenSlider, color: .green)
        configSlider(slider: blueSlider, color: .blue)
        
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
        
        switch sender {
        case redSlider:
            redLabel.text           = currentSliderValue
            redTextField.text       = currentSliderValue
        case greenSlider:
            greenLabel.text         = currentSliderValue
            greenTextField.text     = currentSliderValue
        case blueSlider:
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

    private func configSlider(slider: UISlider, color: UIColor) {
        slider.minimumValue              = 0
        slider.maximumValue              = 1
        slider.value                     = 0.5
        slider.minimumTrackTintColor     = color
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
