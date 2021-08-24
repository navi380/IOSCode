//
//  roundedTextFields.swift
//  FirstApp
//
//  Created by Navi on 7/18/21.
//

import Foundation
import UIKit


import UIKit

@IBDesignable
class RoundTextFields: UITextField {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
        self.layer.cornerRadius = cornerRadius
        }
    }
//
    @IBInspectable var borderWidth: CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
//
    @IBInspectable var borderColor: UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }
    override func layoutIfNeeded() {
        super.layoutIfNeeded()

    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
   
}
