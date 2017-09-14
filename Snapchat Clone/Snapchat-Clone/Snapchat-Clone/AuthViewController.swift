//
//  AuthViewController.swift
//  Snapchat-Clone
//
//  Created by Thomas Cowern New on 9/14/17.
//  Copyright © 2017 vetDevHouse. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class AuthViewController: UIViewController {
    
    @IBOutlet weak var emalTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var topButton: UIButton!
    
    @IBOutlet weak var bottomButton: UIButton!
    
    var loginMode = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func topTapped(_ sender: Any) {
        
        if let email = emalTextField.text {
            if let password = passwordTextField.text {
                if loginMode {
                    //login
                    
                } else {
                    //sign up
                    Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
                        if let error = error {
                            print(error)
                        } else {
                            print("Sign Up Successful")
                        }
                    })
                }
            }
        }
        
        
        
    }
    
    @IBAction func bottomTapped(_ sender: Any) {
        
        if loginMode {
            //switch to sign up mode
            topButton.setTitle("Sign Up", for: .normal)
            bottomButton.setTitle("Switch to Login", for: .normal)
            loginMode = false
        } else {
            //switch to login mode
            topButton.setTitle("Login", for: .normal)
            bottomButton.setTitle("Switch to Sign Up", for: .normal)
            loginMode = true
            
        }
    }
    

}

