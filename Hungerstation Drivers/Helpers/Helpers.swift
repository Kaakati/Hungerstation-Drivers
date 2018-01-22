//
//  Helpers.swift
//  Hungerstation Drivers
//
//  Created by Mohamad Kaakati on 1/22/18.
//  Copyright © 2018 Mohamad Kaakati. All rights reserved.
//

import Foundation
import UIKit


/// UIFont.FontBook.H1
extension UIFont {
    enum fontSize : CGFloat {
        case PhoneNumber = 28
        case PageTitle = 20
        case H1 = 18
        case H2 = 16
        case H3 = 14
        case H4 = 12
    }
    
    struct Fontbook {
        struct PhoneNumber {
            static let Light = UIFont(name: "Ubuntu-Light", size: fontSize.PageTitle.rawValue)
            static let Normal = UIFont(name: "Ubuntu-Regular", size: fontSize.PageTitle.rawValue)
            static let Medium = UIFont(name: "Ubuntu-Medium", size: fontSize.PageTitle.rawValue)
            static let Bold = UIFont(name: "Ubuntu-Bold", size: fontSize.PageTitle.rawValue)
        }
        struct PageTitle {
            static let Light = UIFont(name: "Ubuntu-Light", size: fontSize.PageTitle.rawValue)
            static let Normal = UIFont(name: "Ubuntu-Regular", size: fontSize.PageTitle.rawValue)
            static let Medium = UIFont(name: "Ubuntu-Medium", size: fontSize.PageTitle.rawValue)
            static let Bold = UIFont(name: "Ubuntu-Bold", size: fontSize.PageTitle.rawValue)
        }
        struct H1 {
            static let Light = UIFont(name: "Ubuntu-Light", size: fontSize.H1.rawValue)
            static let Normal = UIFont(name: "Ubuntu-Regular", size: fontSize.H1.rawValue)
            static let Medium = UIFont(name: "Ubuntu-Medium", size: fontSize.H1.rawValue)
            static let Bold = UIFont(name: "Ubuntu-Bold", size: fontSize.H1.rawValue)
        }
        struct H2 {
            static let Light = UIFont(name: "Ubuntu-Light", size: fontSize.H2.rawValue)
            static let Normal = UIFont(name: "Ubuntu-Regular", size: fontSize.H2.rawValue)
            static let Medium = UIFont(name: "Ubuntu-Medium", size: fontSize.H2.rawValue)
            static let Bold = UIFont(name: "Ubuntu-Bold", size: fontSize.H2.rawValue)
        }
        struct H3 {
            static let Light = UIFont(name: "Ubuntu-Light", size: fontSize.H3.rawValue)
            static let Normal = UIFont(name: "Ubuntu-Regular", size: fontSize.H3.rawValue)
            static let Medium = UIFont(name: "Ubuntu-Medium", size: fontSize.H3.rawValue)
            static let Bold = UIFont(name: "Ubuntu-Bold", size: fontSize.H3.rawValue)
        }
        struct H4 {
            static let Light = UIFont(name: "Ubuntu-Light", size: fontSize.H4.rawValue)
            static let Normal = UIFont(name: "Ubuntu-Regular", size: fontSize.H4.rawValue)
            static let Medium = UIFont(name: "Ubuntu-Medium", size: fontSize.H4.rawValue)
            static let Bold = UIFont(name: "Ubuntu-Bold", size: fontSize.H4.rawValue)
        }
    }
}


extension UIColor {
    struct Hungerstation {
        struct Yellow {
            static let Light = UIColor(hex: "ffd400")
            static let Dark = UIColor(hex: "ffd400")
        }
        struct Grey {
            static let Background = UIColor(hex: "F4F4F4")
            static let Light = UIColor(hex: "9B9B9B")
            static let Lighter = UIColor(hex: "EFEFEF")
            static let Dark = UIColor(hex: "222222")
        }
    }
}

//
extension UIView {
    func asCircleForTime(){
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderWidth = 2
        self.layer.borderColor = UIColor.Hungerstation.Yellow.Light.cgColor
        //        self.layer.borderColor = UIColor(hex: "EFEFEF").cgColor
    }
    
    func asCircle(){
        self.layer.cornerRadius = self.frame.width / 2;
        self.layer.masksToBounds = true
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor(red: 103/255, green: 193/255, blue: 187/255, alpha: 1).cgColor
    }
    
    func dropShadow(scale: Bool = true) {
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.08
        self.layer.shadowOffset = CGSize(width: -1, height: 1)
        self.layer.shadowRadius = 8
        
        self.layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        self.layer.shouldRasterize = true
        
        self.layer.rasterizationScale = UIScreen.main.scale
    }
    
    // AutoLayout
    func anchorToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil) {
        
        anchorWithConstantsToTop(top: top, left: left, bottom: bottom, right: right, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0)
    }
    
    func anchorWithConstantsToTop(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, topConstant: CGFloat = 0, leftConstant: CGFloat = 0, bottomConstant: CGFloat = 0, rightConstant: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: topConstant).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -bottomConstant).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: leftConstant).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -rightConstant).isActive = true
        }
        
    }
    
}

// Set Tint Color for Image
extension UIImage {
    
    func maskWithColor(color: UIColor) -> UIImage? {
        let maskImage = cgImage!
        
        let width = size.width
        let height = size.height
        let bounds = CGRect(x: 0, y: 0, width: width, height: height)
        
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
        let context = CGContext(data: nil, width: Int(width), height: Int(height), bitsPerComponent: 16, bytesPerRow: 0, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)!
        
        context.clip(to: bounds, mask: maskImage)
        context.setFillColor(color.cgColor)
        context.fill(bounds)
        
        if let cgImage = context.makeImage() {
            let coloredImage = UIImage(cgImage: cgImage)
            return coloredImage
        } else {
            return nil
        }
    }
    
}

// String Hex Color
/// Use with UIColor(hex: "FFFFFF")
extension UIColor {
    convenience init(hex: String) {
        let scanner = Scanner(string: hex)
        scanner.scanLocation = 0
        
        var rgbValue: UInt64 = 0
        
        scanner.scanHexInt64(&rgbValue)
        
        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff
        
        self.init(
            red: CGFloat(r) / 0xff,
            green: CGFloat(g) / 0xff,
            blue: CGFloat(b) / 0xff, alpha: 1
        )
    }
}
//let color = UIColor(hex: "ff0000")

// Create Action for TopBar Button
extension UIBarButtonItem {
    func addTargetForAction(target: AnyObject, action: Selector) {
        self.target = target
        self.action = action
    }
}

extension UIButton {
    /// Add image on left view
    func leftImage(image: UIImage) {
        self.setImage(image, for: .normal)
        self.setImage(image, for: .focused)
        self.setImage(image, for: .highlighted)
        self.tintColor = UIColor.Hungerstation.Yellow.Light
        self.imageEdgeInsets = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: image.size.width * 6)
    }
}

/// Returns Release and Build Numbers
// Usage:
extension Bundle {
    var releaseVersionNumber: String? {
        return infoDictionary?["CFBundleShortVersionString"] as? String
    }
    var buildVersionNumber: String? {
        return infoDictionary?["CFBundleVersion"] as? String
    }
}
