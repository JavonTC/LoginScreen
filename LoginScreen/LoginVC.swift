//
//  LoginVC.swift
//  LoginScreen
//
//  Created by Javon Calloway on 1/18/23.
//

import UIKit
import Firebase


class LoginVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var emailTextField: UITextField!
    
    @IBOutlet var passwordtextField: UITextField!
    
    @IBOutlet var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.placeholder = "Email"
        passwordtextField.placeholder = "Password"
        passwordtextField.isSecureTextEntry = true
        
        self.emailTextField.delegate = self
        self.passwordtextField.delegate = self
        
        
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton){
        
        guard let email = emailTextField.text else {
            return
        }
        guard let password = passwordtextField.text else {
            return
        }
        Auth.auth().signIn(withEmail: email, password: password) { firebaseResult, error in
            if let e = error{
                print("error")
                
            }
            else{
                self.performSegue(withIdentifier: "goToMainSignInVC", sender: self )
            }
        }
        
        
        
    }
    
    
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "SignUpSegue", sender: self )
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc func dismissKeyboard(){
        view.endEditing(true)
        
    }
    
    
    
}

