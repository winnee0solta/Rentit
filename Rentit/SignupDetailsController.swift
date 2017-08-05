//
//  SignupDetailsController.swift
//  Rentit
//
//  Created by winnee on 8/4/17.
//  Copyright © 2017 Rentit.nepal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignupDetailsController: UIViewController {

     var ref: DatabaseReference!
    @IBOutlet weak var UsernameField: UITextField!
    @IBOutlet weak var AddressField: UITextField!
    @IBOutlet weak var PhonenoField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        ref = Database.database().reference()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    



    @IBAction func GetStartedbtn(_ sender: UIButton) {
        
        if let name = UsernameField.text ,let address = AddressField.text , let phone = PhonenoField.text
        {
            
            
            let userid :String = (Auth.auth().currentUser?.uid)!
            self.ref.child("users").child(userid).updateChildValues(["username":name,"address":address,"phone":phone ])
            self.performSegue(withIdentifier: "gotohome", sender:self)
            
          
            
        }
        
    }
}
