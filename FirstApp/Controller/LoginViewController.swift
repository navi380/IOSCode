//
//  LoginViewController.swift
//  FirstApp
//
//  Created by Navi on 7/18/21.
//

import UIKit

class LoginViewController: UIViewController, UINavigationControllerDelegate {
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    let LoginCall = AuthApi.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround()
        
        NotificationCenter.default.addObserver(self, selector: #selector(SignupViewController.keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
           
        NotificationCenter.default.addObserver(self, selector: #selector(SignupViewController.keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    override func viewWillDisappear(_ animated: Bool) {
            super.viewWillDisappear(animated)
            NotificationCenter.default.removeObserver(self)
        }
    
    @IBAction func LoginBtn(_ sender: Any) {
        guard let password = self.password.text else {return}
        guard let email = self.email.text else {return}
        let loginUserModel = LoginModel(login: email, password: password)
        self.displayAnimatedActivityIndicatorView()
        LoginCall.loginUser(login: loginUserModel) { issuccess, str in
            if issuccess{
                self.hideAnimatedActivityIndicatorView()
                self.finishLogIn()
            }else{
                self.showAlert(alertText: "Login", alertMessage: str)
            }
        }
        
    }
    @IBAction func SignUp(_ sender: Any) {
        let signupVc = self.storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        navigationController?.pushViewController(signupVc, animated: true)
    }
    
    
    func finishLogIn() {
        UserDefaults.standard.setLoggedIn(value: true)
        //third way with storyboard navigation controller
        let mytabBar = self.storyboard?.instantiateViewController(withIdentifier: "TabbarViewController") as! UITabBarController
//        mytabBar.modalPresentationStyle = .fullScreen
//        present(mytabBar, animated: true, completion: nil)
        
//        UIApplication.shared.connectedScenes.first is used to get the first scene connected to your app, this article assumes your app has only one scene (ie. user cannot open more than one scene of your app in iPad multitasking mode). As your app has only one scene, the .first will get the one and only scene of your app.

        (UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate)?.changeRootViewController(mytabBar)
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
