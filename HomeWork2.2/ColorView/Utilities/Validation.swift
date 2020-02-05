//
//  Validation.swift
//  ColorView
//
//  Created by yauheni prakapenka on 02.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import Foundation

struct TextFieldValidation {
    
    func validateData(text: String) -> String {
        
        var newText = text
        newText = text.replacingOccurrences(of: "00", with: "0")
        
        if newText.first == "." {
            newText = "0."
        }
        
        if countSpecificChar(text: newText, char: ".") > 1 {
            newText.removeLast()
        }
        
        if text.count > 4 {
            newText.removeLast()
            return newText
        }
        
        return newText
    }
    
    private func countSpecificChar(text: String, char: Character) -> Int {
        let letters = Array(text)
        var count = 0
        
        for letter in letters {
            if letter == char {
                count += 1
            }
        }
        
        return count
    }
}
