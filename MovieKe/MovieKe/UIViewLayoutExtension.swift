//
//  UIViewLayoutExtension.swift
//  MovieKe
//
//  Created by Kunwar on 12/4/14.
//  Copyright (c) 2014 Kunwar. All rights reserved.
//

import UIKit

extension UIView {
    
    func showBorder() {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.redColor().CGColor
    }
    
    func showBorderWithColor(color: UIColor) {
        self.layer.borderWidth = 1.0
        self.layer.borderColor = color.CGColor
    }
}