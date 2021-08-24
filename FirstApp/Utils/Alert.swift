//
//  Alert.swift
//  FirstApp
//
//  Created by Navi on 7/27/21.
//

import Foundation
import UIKit

extension UIViewController {
//Show a basic alert
func showAlert(alertText : String, alertMessage : String) {
    let alert = UIAlertController(title: alertText, message: alertMessage, preferredStyle: UIAlertController.Style.alert)
    alert.addAction(UIAlertAction(title: "Got it", style: UIAlertAction.Style.default, handler: nil))
//Add more actions as you see fit
self.present(alert, animated: true, completion: nil)
  }
}
