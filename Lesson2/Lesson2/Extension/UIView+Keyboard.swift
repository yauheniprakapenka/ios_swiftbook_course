//
//  UIView+Keyboard.swift
//  Lesson2
//
//  Created by yauheni prakapenka on 01.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

extension UIView {
    func makeDismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.endEditing))
        self.addGestureRecognizer(tap)
    }
}

