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
    @IBOutlet var validateLabel: UILabel!
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        redSlider      = configSlider(slider: redSlider, color: .red)
        greenSlider    = configSlider(slider: greenSlider, color: .green)
        blueSlider     = configSlider(slider: blueSlider, color: .blue)
        
        redLabel       = configLabel(label: redLabel, sliderValue: redSlider.value)
        greenLabel     = configLabel(label: greenLabel, sliderValue: greenSlider.value)
        blueLabel      = configLabel(label: blueLabel, sliderValue: blueSlider.value)
        
        redTextField   = configTextField(textField: redTextField, sliderValue: redSlider.value)
        greenTextField = configTextField(textField: greenTextField, sliderValue: greenSlider.value)
        blueTextField  = configTextField(textField: blueTextField, sliderValue: blueSlider.value)
        
        redTextField.inputAccessoryView   = makeToolbarOnKeyboard()
        greenTextField.inputAccessoryView = makeToolbarOnKeyboard()
        blueTextField.inputAccessoryView  = makeToolbarOnKeyboard()
        
        redTextField.delegate   = self
        greenTextField.delegate = self
        blueTextField.delegate  = self
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(redSlider.value), alpha: 1)
        
        view.makeDismissKeyboardTapGesture()
    }
    
    // MARK: - IB Actions
    
    @IBAction func valueSliderChanged(_ sender: UISlider) {
        let currentSliderValue = String(format: "%.2f", sender.value)
        
        let redOpacity   = CGFloat(redSlider.value)
        let greenOpacity = CGFloat(greenSlider.value)
        let blueOpacity  = CGFloat(blueSlider.value)
        
        switch sender {
        case redSlider:
            redLabel.text       = currentSliderValue
            redTextField.text   = currentSliderValue
        case greenSlider:
            greenLabel.text     = currentSliderValue
            greenTextField.text = currentSliderValue
        case blueSlider:
            blueLabel.text      = currentSliderValue
            blueTextField.text  = currentSliderValue
        default:
            print("Error getting value from slider")
        }
        
        colorView.backgroundColor = UIColor(red: redOpacity, green: greenOpacity, blue: blueOpacity, alpha: 1)
    }
    
    // MARK: - Add Done button on Keyboard
    
    private func makeToolbarOnKeyboard() -> UIToolbar {
        let toolbar = UIToolbar(frame: CGRect(origin: .zero, size: .init(width: view.frame.width, height: 0)))
        
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let doneButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(doneButtonTapped))
        
        toolbar.setItems([flexibleSpace, doneButton], animated: false)
        toolbar.sizeToFit()
        
        return toolbar
    }
    
    @objc
    private func doneButtonTapped(_ sender: UIButton) {
        
        guard let redField = redTextField.text, let greenField = greenTextField.text, let blueField = blueTextField.text, !redField.isEmpty && !greenField.isEmpty && !blueField.isEmpty else {
            
            validateLabel.shake() {
                self.validateLabel.textColor = .red
                Timer.scheduledTimer(withTimeInterval: 0.6, repeats: false) { [weak self] _ in
                    self?.validateLabel.textColor = .darkGray
                }
            }
            
            return
        }
        
        redSlider.value     = Float(redTextField.text!)!
        greenSlider.value   = Float(greenTextField.text!)!
        blueSlider.value    = Float(blueTextField.text!)!
        
        redLabel.text       = String(format: "%.2f", redSlider.value)
        greenLabel.text     = String(format: "%.2f", greenSlider.value)
        blueLabel.text      = String(format: "%.2f", blueSlider.value)
        
        redTextField.text   = String(format: "%.2f", redSlider.value)
        greenTextField.text = String(format: "%.2f", greenSlider.value)
        blueTextField.text  = String(format: "%.2f", blueSlider.value)
        
        colorView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        view.endEditing(true)
    }
    
    private func configSlider(slider: UISlider, color: UIColor) -> UISlider {
        slider.minimumValue          = 0
        slider.maximumValue          = 1
        slider.value                 = 0.3
        slider.minimumTrackTintColor = color
        
        return slider
    }
    
    private func configTextField(textField: UITextField, sliderValue: Float) -> UITextField {
        textField.text          = String(format: "%.2f", sliderValue)
        textField.keyboardType  = .decimalPad
        textField.textAlignment = .right
        
        return textField
    }
    
    private func configLabel(label: UILabel, sliderValue: Float) -> UILabel {
        label.text = String(format: "%.2f", sliderValue)
        
        return label
    }
}

// MARK: - UITextFieldDelegate

extension ViewController: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        
        let validation = TextFieldValidation()
        textField.text = validation.validateData(text: textField.text!)
    }
}
