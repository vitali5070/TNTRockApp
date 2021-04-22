//
//  LoginViewController.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/10/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit
import Firebase


class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var warningLabel: UILabel!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    
    var keyboardDismissTapGesture: UITapGestureRecognizer?
  
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidShow), name: UIResponder.keyboardDidShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardDidHide), name: UIResponder.keyboardDidHideNotification, object: nil)
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if user != nil{
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
            }
        }
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        emailField.text = ""
        passwordField.text = ""
    
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {

      if textField == emailField {
         textField.resignFirstResponder()
         passwordField.becomeFirstResponder()
      } else if textField == passwordField {
         textField.resignFirstResponder()
            loginButtonTapped()
      }
     return true
    }
    
   
    
  
    
    @objc func keyboardWillShow(notification: Notification){
        
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height
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
        
        (self.view as! UIScrollView).scrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrameSize.height, right: 0)
        
    }
    
    @objc func keyboardDidHide(notification: Notification){
      (self.view as! UIScrollView).contentSize = CGSize(width: self.view.bounds.width, height: self.view.bounds.height)
        
    }
    
    
   
    private func setupView(){
        
        loginButton.layer.cornerRadius = loginButton.frame.size.height / 2
        warningLabel.alpha = 0
        
        
    }
    
    private func showWarningLabel (withText text: String){
        
        warningLabel.text = text
        
        UIView.animate(withDuration: 3, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: [.curveEaseInOut], animations: { [weak self] in
            self?.warningLabel.alpha = 1
        }) { [weak self] complete in
            self?.warningLabel.alpha = 0
        }
    }
    
    @IBAction private func loginButtonTapped(){
        
        guard let email = emailField.text, let password = passwordField.text, email != "", password != "" else { showWarningLabel(withText: "check entered data!")
            return}
        
        
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] (user, error) in
            if error != nil{
                self?.showWarningLabel(withText: "Error occured")
                return
            }

            if user != nil{
                self?.performSegue(withIdentifier: "logInSegue", sender: nil)
                return
            }

            self?.showWarningLabel(withText: "No such user")
        }
    }
    
    
    }
    
