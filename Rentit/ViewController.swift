//
//  ViewController.swift
//  Rentit
//
//  Created by winnee on 7/1/17.
//  Copyright © 2017 Rentit.nepal. All rights reserved.
//

import UIKit

import Firebase
import SVProgressHUD

class ViewController: UIViewController {

    
    
    @IBOutlet weak var EmailField: UITextField!
    @IBOutlet weak var PasswordFileld: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        Auth.auth().addStateDidChangeListener{auth,user in
            
            if user != nil {
                //user is signed in
                
    
                self.performSegue(withIdentifier: "gotohome", sender:self)
                
            }
            
            
        }
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Loginbtn(_ sender: UIButton) {
        
        SVProgressHUD.show(withStatus: "Logging in!!")
        if let email = EmailField.text , let password = PasswordFileld.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if let u = user
                {
                    SVProgressHUD.dismiss()
                    self.performSegue(withIdentifier: "gotohome", sender:self)
                }
                
            }
        }else{
            SVProgressHUD.dismiss()
            //show some error
        }
    }

}

