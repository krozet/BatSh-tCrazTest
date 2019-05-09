//
//  Utility.swift
//  BatSh!tCrazyTest
//
//  Created by user153091 on 5/7/19.
//  Copyright © 2019 Keawa Rozet. All rights reserved.
//

import Foundation
import UIKit
import ImageIO

struct GlobalVariable {
  static var gbCurrentTopLeft = false

  mutating func getGradientCorner() -> Bool {
    gbCurrentTopLeft = !gbCurrentTopLeft
    return gbCurrentTopLeft
  }
}

class Utility {
    public static var MINT = UIColor(rgb: 0x98FF98)
    public static var TURQUOISE = UIColor(rgb: 0x40E0D0)
    public static var SALMON = UIColor(rgb: 0xEB9099)
    public static var PASTEL_PINK = UIColor(rgb: 0x0F5D0E1)
    public static var CHARCOAL = UIColor(rgb: 0x595B5A)
    public static var LIGHT_GREY = UIColor(rgb: 0x707271)
    public static var PURPLE = UIColor(rgb: 0xA239FF)
    public static var AQUA = UIColor(rgb: 0x00F8FF)

    public static var GB_MINT_TURQUOISE = [MINT.cgColor, TURQUOISE.cgColor]
    public static var GB_SALMON_MINT = [SALMON.cgColor, MINT.cgColor]
    public static var GB_PASTELPINK_SALMON = [PASTEL_PINK.cgColor, SALMON.cgColor]
    public static var GB_LIGHTGREY_CHARCOAL = [LIGHT_GREY.cgColor, CHARCOAL.cgColor]
    public static var GB_CHARCOAL_LIGHTGREY = [CHARCOAL.cgColor, LIGHT_GREY.cgColor]
    public static var GB_PURPLE_AQUA = [PURPLE.cgColor, AQUA.cgColor]
    public static var GB_AQUA_PURPLE = [AQUA.cgColor, PURPLE.cgColor]
}

extension UIViewController {
    func setGradientBackground(gradientBackgroungColors: [Any], startTopLeft: Bool = true) {
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        layer.colors = gradientBackgroungColors
        if startTopLeft {
          layer.startPoint = CGPoint(x: 0,y: 0)
          layer.endPoint = CGPoint(x: 1,y: 1)
        } else {
          layer.startPoint = CGPoint(x: 1,y: 0)
          layer.endPoint = CGPoint(x: 0,y: 1)
        }

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

extension UIImage {

   public class func gifWithData(data: NSData) -> UIImage? {
       guard let source = CGImageSourceCreateWithData(data, nil) else {
           print("SwiftGif: Source for the image does not exist")
           return nil
       }
    return UIImage.animatedImageWithSource(source: source)
   }

   public class func gifWithName(name: String) -> UIImage? {
    guard let bundleURL = Bundle.main.url(forResource: name, withExtension: "gif") else {
           print("SwiftGif: This image named \"\(name)\" does not exist")
           return nil
       }
    guard let imageData = NSData(contentsOf: bundleURL) else {
           print("SwiftGif: Cannot turn image named \"\(name)\" into NSData")
           return nil
       }
    return gifWithData(data: imageData)
   }

   class func delayForImageAtIndex(index: Int, source: CGImageSource!) -> Double {
       var delay = 0.1

       // Get dictionaries
       let cfProperties = CGImageSourceCopyPropertiesAtIndex(source, index, nil)
       let gifProperties: CFDictionary = unsafeBitCast(
           CFDictionaryGetValue(cfProperties,
               Unmanaged.passUnretained(kCGImagePropertyGIFDictionary).toOpaque()),
           to: CFDictionary.self)

       // Get delay time
       var delayObject: AnyObject = unsafeBitCast(
           CFDictionaryGetValue(gifProperties,
               Unmanaged.passUnretained(kCGImagePropertyGIFUnclampedDelayTime).toOpaque()),
           to: AnyObject.self)
       if delayObject.doubleValue == 0 {
           delayObject = unsafeBitCast(CFDictionaryGetValue(gifProperties,
                                                            Unmanaged.passUnretained(kCGImagePropertyGIFDelayTime).toOpaque()), to: AnyObject.self)
       }

       delay = delayObject as! Double

       if delay < 0.1 {
           delay = 0.1 // Make sure they're not too fast
       }

       return delay
   }

    class func gcdForPair( a: Int?, b: Int?) -> Int {
       // Check if one of them is nil
       if b == nil || a == nil {
           if b != nil {
               return b!
           } else if a != nil {
               return a!
           } else {
               return 0
           }
       }
        var _a = a!
        var _b = b!
       // Swap for modulo
       if _a < _b {
           let c = _a
           _a = _b
           _b = c
       }

       // Get greatest common divisor
       var rest: Int
       while true {
           rest = _a % _b

           if rest == 0 {
               return _b // Found it
           } else {
               _a = _b
               _b = rest
           }
       }
   }

   class func gcdForArray(array: Array<Int>) -> Int {
       if array.isEmpty {
           return 1
       }

       var gcd = array[0]

       for val in array {
        gcd = UIImage.gcdForPair(a: val, b: gcd)
       }

       return gcd
   }

   class func animatedImageWithSource(source: CGImageSource) -> UIImage? {
       let count = CGImageSourceGetCount(source)
    var images = [CGImage]()
       var delays = [Int]()

       // Fill arrays
       for i in 0..<count {
           // Add image
           if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
               images.append(image)
           }

           // At it's delay in cs
        let delaySeconds = UIImage.delayForImageAtIndex(index: Int(i),
               source: source)
           delays.append(Int(delaySeconds * 1000.0)) // Seconds to ms
       }

       // Calculate full duration
       let duration: Int = {
           var sum = 0

           for val: Int in delays {
               sum += val
           }

           return sum
           }()

       // Get frames
    let gcd = gcdForArray(array: delays)
       var frames = [UIImage]()

       var frame: UIImage
       var frameCount: Int
       for i in 0..<count {
        frame = UIImage(cgImage: images[Int(i)])
           frameCount = Int(delays[Int(i)] / gcd)

           for _ in 0..<frameCount {
               frames.append(frame)
           }
       }

       // Heyhey
    let animation = UIImage.animatedImage(with: frames,
           duration: Double(duration) / 1000.0)

       return animation
   }
}
