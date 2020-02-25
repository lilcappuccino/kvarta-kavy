//
//  UIView+Gradient.swift
//  KvartaKavy
//
//  Created by Vadim Marchenko on 25.02.2020.
//  Copyright © 2020 lilcappucc. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    func createGradient(colors: [CGColor]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        
        gradientLayer.frame = self.bounds
        return gradientLayer
    }
    
}


