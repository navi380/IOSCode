//
//  File.swift
//  FirstApp
//
//  Created by Navi on 7/18/21.
//

import Foundation
import UIKit
//
//@IBDesignable extension UIButton {
//
////    @IBInspectable var borderWidth: CGFloat {
////        set {
////            layer.borderWidth = newValue
////        }
////        get {
////            return layer.borderWidth
////        }
////    }
//
//    @IBInspectable var cornerRadius: CGFloat {
//        set {
//            layer.cornerRadius = newValue
//        }
//        get {
//            return layer.cornerRadius
//        }
//    }
//
//    @IBInspectable var borderColor: UIColor? {
//        set {
//            guard let uiColor = newValue else { return }
//            layer.borderColor = uiColor.cgColor
//        }
//        get {
//            guard let color = layer.borderColor else { return nil }
//            return UIColor(cgColor: color)
//        }
//    }
//}

import UIKit

@IBDesignable
class RoundButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }

    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
//    override func {
//        super.layoutIfNeeded()
//
//    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
   
}


