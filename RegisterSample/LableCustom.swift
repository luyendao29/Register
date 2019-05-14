//
//  LableCustom.swift
//  RegisterSample
//
//  Created by hoanganh on 5/3/19.
//  Copyright © 2019 hoanganh. All rights reserved.
//

import UIKit

class LableCustom: UILabel {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            if newValue == -1 {
                layer.cornerRadius = frame.width < frame.height ? frame.width * 0.5 : frame.height * 0.5
            } else {
                layer.cornerRadius = newValue
            }
            contentMode = .scaleToFill
            clipsToBounds = true
            layer.masksToBounds = true
        }
    }
}

