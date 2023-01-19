//
//  SignUpVC.swift
//  LoginScreen
//
//  Created by Javon Calloway on 1/18/23.
//

import UIKit
import Firebase

class SignUpVC: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var nameUITextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameUITextField.placeholder = "Name"
        emailTextField.placeholder = "Email"
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        
        self.nameUITextField.delegate = self
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        
        
        
        
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func signUpButtonPressed(_ sender: UIButton) {
        
        guard let email = emailTextField.text else{
            return
        }
        guard let password = passwordTextField.text else{
            return
        }
        guard let name = nameUITextField.text else{
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { firebaseResult, error in
            if let e = error{
                print("Error")
            }
            else {
                self.performSegue(withIdentifier: "goToMainSignInVC", sender: self)
                //Go to HomeScreen
                
            }
        }
    }
    
    
    @IBAction func backToSignInVCPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "signInSegue", sender: self)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
