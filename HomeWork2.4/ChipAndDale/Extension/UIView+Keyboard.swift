//
//  UIView+Keyboard.swift
//  ChipAndDale
//
//  Created by yauheni prakapenka on 09.02.2020.
//  Copyright © 2020 yauheni prakapenka. All rights reserved.
//

import UIKit

extension UIView {
    
    func makeDissmissKeyboardTap() {
        let tap = UITapGestureRecognizer(target: self,
                                      action: #selector(self.endEditing))
        self.addGestureRecognizer(tap)
    }
    
}
