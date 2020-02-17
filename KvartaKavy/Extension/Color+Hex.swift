//
//  Color+Hex.swift
//  KvartaKavy
//
//  Created by dewill on 08.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import UIKit

public extension UIColor {
    public convenience init(hex: Int, alpha: CGFloat = 1.0) {
        let r = CGFloat((hex & 0xFF0000) >> 16) / 255.0
        let g = CGFloat((hex & 0x00FF00) >> 8) / 255.0
        let b = CGFloat(hex & 0x0000FF) / 255.0
        print("\(r) \(g) \(b)")
        self.init(red: r, green: g, blue: b, alpha: alpha)
    }
}
