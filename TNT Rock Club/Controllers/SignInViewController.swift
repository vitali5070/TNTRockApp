//
//  SignInViewController.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/29/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit
import Firebase


class SignInViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var surnameTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    
     var keyboardDismissTapGesture: UITapGestureRecognizer?

    
    var user: User!
    var ref: DatabaseReference!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        registerButton.layer.cornerRadius = registerButton.frame.size.height / 2
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
               
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == nameTextField{
            textField.resignFirstResponder()
            surnameTextField.becomeFirstResponder()
        } else if textField == surnameTextField{
            textField.resignFirstResponder()
            ageTextField.becomeFirstResponder()
        } else if textField == ageTextField{
            textField.resignFirstResponder()
            emailTextField.becomeFirstResponder()
        }else if textField == emailTextField {
         textField.resignFirstResponder()
         passwordTextField.becomeFirstResponder()
      } else if textField == passwordTextField {
         textField.resignFirstResponder()
         registerButtonTapped()
      }
     return true
    }
    
    
    
    
    
    @objc func keyboardWillShow(notification: Notification){
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height - 100
            }
        }
        
        if keyboardDismissTapGesture == nil{
            keyboardDismissTapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
            keyboardDismissTapGesture?.cancelsTouchesInView = false
            self.view.addGestureRecognizer(keyboardDismissTapGesture!)
        }
    }

    @objc func dismissKeyboard(sender: UITapGestureRecognizer){
        view.endEditing(true)
    }
    
    @objc func keyboardWillHide(notification: Notification){
        
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
        
        if keyboardDismissTapGesture != nil{
            self.view.removeGestureRecognizer(keyboardDismissTapGesture!)
            keyboardDismissTapGesture = nil
        }
    }
    
    @objc func keyboardDidShow(notification: Notification){
        guard let userInfo = notification.userInfo else {return}
        let keyboardFrameSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height + keyboardFrameSize.height)
        
        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameSize.height - 100, right: 0)
        
    }
    
    @objc func keyboardDidHide(notification: Notification){
      (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        
    }
    
    @IBAction func registerButtonTapped() {
        guard let email: String = emailTextField.text, let password: String = passwordTextField.text, email != "", password != "" else {
            // show alert controller
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self](user, error) in
            if error != nil{
                //show alert controller
                return
            }
            if user != nil{
                self?.performSegue(withIdentifier: "signInSegue", sender: nil)
                return
            }else{
                print("User not created")
            }
        }
        
        let newUser = UserModel(user: user, age: ageTextField.text!, name: nameTextField.text!, surname: surnameTextField.text!)
        
        
    }
    
    
    @IBAction private func cancelButtonTapped(_ sender: UIButton){
        dismiss(animated: true, completion: nil)
    }

}
