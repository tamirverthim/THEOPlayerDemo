//
//  UIColor+Hex.swift
//  THEOPlayerDemo
//
//  Created by Slobodan Novakovic on 9/30/18.
//  Copyright © 2018 Slobo. All rights reserved.
//

import UIKit

extension UIColor {
    convenience init(hexRGB: UInt32, alpha: CGFloat) {
        let red = CGFloat((hexRGB & 0xFF0000) >> 16)/256.0
        let green = CGFloat((hexRGB & 0xFF00) >> 8)/256.0
        let blue = CGFloat(hexRGB & 0xFF)/256.0
        
        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
    static let theoColorYellow = UIColor(hexRGB: 0xFFC60F, alpha: 1)
}
