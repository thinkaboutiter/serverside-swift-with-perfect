//
//  UIView+Extensions.swift
//  BubblyChatClient
//
//  Created by boyankov on W08 22/Feb/2018 Thu.
//  Copyright © 2018 boyankov@yahoo.com. All rights reserved.
//

import UIKit

// MARK: - Taking snapshot form `UIView` object
extension UIView {
    
    func snapshot() -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)
        
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        
        let result = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        return result!
    }
}

// MARK: - Rounding `UIView` object
extension UIView {
    
    func round(borderWidth width: CGFloat = 0, borderColor color: UIColor = UIColor.clear) {
        self.layer.cornerRadius = self.bounds.width / 2
        self.clipsToBounds = true
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}

// MARK: - Cards shadows
extension UIView {
    
    func addCardShadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: -2, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 2
        self.clipsToBounds = false
    }
}

