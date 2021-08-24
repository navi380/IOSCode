//
//  SignupViewController.swift
//  FirstApp
//
//  Created by Navi on 7/18/21.
//

import UIKit

class SignupViewController: UIViewController {

    @IBOutlet weak var txtFirstName: UITextField!
    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var scrollView: UIScrollView!
    //    let registerInstance = RegisterUserApi()
    let registerCall = AuthApi.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(SignupViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           
           NotificationCenter.default.addObserver(self, selector: #selector(SignupViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
         
        hideKeyboardWhenTappedAround()
//        firttName.clipsToBounds = true
//        lastName.clipsToBounds = true
//        email.clipsToBounds=true
//        password.clipsToBounds = true
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func signupBtn(_ sender: Any) {
        guard let fname = self.txtFirstName.text else {return}
        guard let lname = self.txtLastName.text else {return}
        guard let email = self.txtEmail.text else {return}
        guard let password = self.txtPassword.text else {return}
        let registerUser = RegisterModel(name: fname+lname, email: email, password: password)
        registerCall.RegisterUser(register: registerUser) { isTrue, str  in
            if isTrue{
                let loginVc = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                self.navigationController?.pushViewController(loginVc, animated: true)
            }else{
                self.showAlert(alertText: "SignUp", alertMessage: str)
            }
        }
    }
    
    
    
    @IBAction func loginVc(_ sender: Any) {
        let loginVcs = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        navigationController?.pushViewController(loginVcs, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
       guard let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
       else {
         // if keyboard size is not available for some reason, dont do anything
         return
       }

       let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: keyboardSize.height , right: 0.0)
       scrollView.contentInset = contentInsets
       scrollView.scrollIndicatorInsets = contentInsets
     }

     @objc func keyboardWillHide(notification: NSNotification) {
       let contentInsets = UIEdgeInsets(top: 0.0, left: 0.0, bottom: 0.0, right: 0.0)
           
       
       // reset back the content inset to zero after keyboard is gone
       scrollView.contentInset = contentInsets
       scrollView.scrollIndicatorInsets = contentInsets
     }
}

