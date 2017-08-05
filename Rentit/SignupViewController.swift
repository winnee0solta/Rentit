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
import FirebaseDatabase

class SignupViewController: UIViewController {

   
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
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
                    let userid :String = (user?.uid)!
                    
                    self.ref.child("users").child(userid).setValue(["email":email,"password":password ])
                    self.performSegue(withIdentifier: "gotoprofileentery", sender:self)
                }
                
            }

        }
        
    }

}
