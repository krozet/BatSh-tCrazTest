//
//  Utility.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 5/7/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation
import UIKit

class Utility {
    public static var MINT = UIColor(rgb: 0x98FF98)
    public static var TURQUOISE = UIColor(rgb: 0x40E0D0)
    public static var SALMON = UIColor(rgb: 0xEB9099)
    public static var PASTEL_PINK = UIColor(rgb: 0x0F5D0E1)
    public static var CHARCOAL = UIColor(rgb: 0x595B5A)
    public static var LIGHT_GREY = UIColor(rgb: 0x707271)
    
    public static var GB_MINT_TURQUOISE = [MINT.cgColor, TURQUOISE.cgColor]
    public static var GB_SALMON_MINT = [SALMON.cgColor, MINT.cgColor]
    public static var GB_PASTELPINK_SALMON = [PASTEL_PINK.cgColor, SALMON.cgColor]
    public static var GB_LIGHTGREY_CHARCOAL = [LIGHT_GREY.cgColor, CHARCOAL.cgColor]
    public static var GB_CHARCOAL_LIGHTGREY = [CHARCOAL.cgColor, LIGHT_GREY.cgColor]
}

extension UIViewController {
    func setGradientBackground(gradientBackgroungColors: [Any]) {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = gradientBackgroungColors
        layer.startPoint = CGPoint(x: 0,y: 0)
        layer.endPoint = CGPoint(x: 1,y: 1)
        view.layer.insertSublayer(layer, at: 0)
    }
}

extension UIView {
    // Name this function in a way that makes sense to you...
    // slideFromLeft, slideRight, slideLeftToRight, etc. are great alternative names
    func slideFromRight(duration: TimeInterval = 0.5, completionDelegate: AnyObject? = nil) {
        // Create a CATransition animation
        let slideFromRightTransition = CATransition()
        
        // Set its callback delegate to the completionDelegate that was provided (if any)
        if let delegate: AnyObject = completionDelegate {
            slideFromRightTransition.delegate = delegate as? CAAnimationDelegate
        }
        
        // Customize the animation's properties
        slideFromRightTransition.type = CATransitionType.push
        slideFromRightTransition.subtype = CATransitionSubtype.fromRight
        slideFromRightTransition.duration = duration
        slideFromRightTransition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        slideFromRightTransition.fillMode = CAMediaTimingFillMode.removed
        
        // Add the animation to the View's layer
        self.layer.add(slideFromRightTransition, forKey: "slideInFromRightTransition")
    }
}

extension UIView {
    func setGradientBackground(colours: [Any]) -> Void {
        self.setGradientBackground(colours: colours, locations: nil)
    }
    
    func setGradientBackground(colours: [Any], locations: [NSNumber]?) -> Void {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colours
        gradient.locations = locations
        self.layer.insertSublayer(gradient, at: 0)
    }
}

// usage
// let color = UIColor(red: 0xFF, green: 0xFF, blue: 0xFF)
// let color2 = UIColor(rgb: 0xFFFFFF)

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
