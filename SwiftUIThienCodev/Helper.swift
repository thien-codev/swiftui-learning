//
//  Utils.swift
//  SwiftUIThienCodev
//
//  Created by ndthien01 on 16/10/2023.
//

import Foundation
import UIKit

extension UIView {
    class func viewFromNibForClass<T>(owner: UIView? = nil, nibName: String = String(describing: T.self), bundle: Foundation.Bundle? = nil) -> T {
        let nib = UINib(nibName: nibName, bundle: bundle)
        guard let view = nib.instantiate(withOwner: owner, options: nil)[0] as? T else {
            fatalError("no nib for class named \(nibName)")
        }
        return view
    }
    
    class func fromNib<T: UIView>() -> T {
        return Bundle(for: T.self).loadNibNamed(String(describing: T.self), owner: nil, options: nil)![0] as! T
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}

public extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColour: UIColor? {
        get {
            guard let borderColor = layer.borderColor else { return nil }
            return UIColor(cgColor: borderColor)
        }
        set { layer.borderColor = newValue?.cgColor }
    }
    
    @IBInspectable var shadowColour: UIColor? {
        get {
            guard let shadowColor = layer.shadowColor else { return nil }
            return UIColor(cgColor: shadowColor)
        }
        set { layer.shadowColor = newValue?.cgColor }
    }
    
    func dropShadow(cornerRadius: CGFloat, shadowOffset: CGSize = CGSize(width: -2, height: 2), shadowColor: UIColor = UIColor.black.withAlphaComponent(0.6), shadowOpacity: Float = 1) {
        layer.masksToBounds = false
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
    }
}
