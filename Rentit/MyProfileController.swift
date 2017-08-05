//
//  MyProfileController.swift
//  Rentit
//
//  Created by winnee on 8/5/17.
//  Copyright © 2017 Rentit.nepal. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class MyProfileController: UIViewController {
    
    var ref: DatabaseReference!
   
    
    

    @IBOutlet weak var EmailField: UILabel!
    @IBOutlet weak var UserNameField: UILabel!
    @IBOutlet weak var AddressField: UILabel!
    @IBOutlet weak var PhoneField: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       ref = Database.database().reference()
        let userid :String = (Auth.auth().currentUser?.uid)!
      
//        self.ref.child("users").child(userid).observe(.childAdded, with: {(snapshot) in
//            
//            if let email = snapshot.value["email"] as String{
//                EmailField.text = email
//            }
//        })
        
        
        self.ref.child("users").child(userid).observeSingleEvent(of: .value, with: {(snapshot) in
            
            let value_v = snapshot.value as? NSDictionary
            let email = value_v?["email"] as? String ?? ""
            let address = value_v?["address"] as? String ?? ""
            let phone = value_v?["phone"] as? String ?? ""
            let username = value_v?["username"] as? String ?? ""
            
            self.EmailField.text = email
            self.AddressField.text = address
            self.PhoneField.text = phone
            self.UserNameField.text = username            
            
        })
            {(error) in
                
            }
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func Loudbtn(_ sender: UIButton) {
        
    }
   
}
