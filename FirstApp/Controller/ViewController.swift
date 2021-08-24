//
//  ViewController.swift
//  FirstApp
//
//  Created by Navi on 7/17/21.
//

import UIKit

class ViewController: UIViewController {

   
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.sizeToFit()
        
    }
    @IBAction func loginBtn(_ sender: Any) {
        let loginVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(loginVc, animated: true)
    }
    @IBAction func SignupBtn(_ sender: Any) {  
        let SignUpVC = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        self.navigationController?.pushViewController(SignUpVC, animated: true)
    }
    
}

