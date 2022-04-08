//
//  UIViewExtension.swift
//  Sary
//
//  Created by EdfaPay on 08/04/2022.
//

import Foundation
import UIKit
@IBDesignable extension UIView {
    @IBInspectable var borderColor: UIColor? {
        set {
            layer.borderColor = newValue?.cgColor
            layer.masksToBounds = true

        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            } else {
                return nil
            }
        }
    }
    
    @IBInspectable var cornerRadious: CGFloat {
        set {
            layer.cornerRadius = newValue
        }
        get {
            let radius = layer.cornerRadius
            return radius
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        set {
            layer.borderWidth = newValue

        }
        get {
            let radius = layer.borderWidth
            return radius
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        set {
            self.layer.shadowColor = newValue.cgColor
            self.layer.shadowOpacity = 0.3
            self.layer.shadowOffset = CGSize.zero
//            self.layer.shadowOffset = CGSize(width: 2 , height:2)

//            self.layer.shadowRadius = 2
            layer.cornerRadius = self.layer.cornerRadius == 0 ? 8.0 : self.layer.cornerRadius

        }
        get {
            let color = UIColor.lightGray
            return color
        }
    }
    
    @IBInspectable var corners: UIRectCorner {
        set {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: newValue, cornerRadii: CGSize(width: self.layer.cornerRadius, height: self.layer.cornerRadius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask

        }
        get {
            return [.bottomLeft]
        }
    }
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
            let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            layer.mask = mask
        }

}

