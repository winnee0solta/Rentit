//
//  SignupViewController.swift
//  Rentit
//
//  Created by winnee on 8/4/17.
//  Copyright © 2017 Rentit.nepal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class SignupViewController: UIViewController {

   
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

 
    @IBAction func CreateAccountbtn(_ sender: UIButton) {
        if let email = EmailField.text ,let password = PasswordField.text
        {
            Auth.auth().createUser(withEmail: email, password: password) { (user, error) in
                // ...
                if let u = user
                {
                    self.performSegue(withIdentifier: "gotohome", sender:self)
                }
                
            }

        }
        
    }

}
