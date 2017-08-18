






//
//  RentPostController.swift
//  Rentit
//
//  Created by winnee on 8/5/17.
//  Copyright © 2017 Rentit.nepal. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth
import Firebase
import SVProgressHUD

class RentPostController: UIViewController {
    
    var ref: DatabaseReference!
    
    
    @IBOutlet weak var TitleField: UITextField!
    @IBOutlet weak var DescriptionField: UITextField!
    @IBOutlet weak var AddressField: UITextField!
    @IBOutlet weak var PriceField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
       
        
                // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func PostRentBtn(_ sender: UIButton) {
        SVProgressHUD.show(withStatus: "Posting...!!!")
        if let title = TitleField.text ,let dec = DescriptionField.text , let address = AddressField.text, let price = PriceField.text
        {
             let userid :String = (Auth.auth().currentUser?.uid)!
            
            self.ref.child("users").child(userid).observeSingleEvent(of: .value, with: {(snapshot) in
                
                let value_v = snapshot.value as? NSDictionary
                let email_v = value_v?["email"] as? String ?? ""
                let phone_v = value_v?["phone"] as? String ?? ""
                let username_v = value_v?["username"] as? String ?? ""
                
                
                self.ref.child("posts").childByAutoId()
                    .setValue([ "uid":userid
                        , "address" : address
                        ,"price" : price
                        , "dec" : dec
                        , "title": title
                        , "username" : username_v
                        ,"phone" : phone_v
                        , "email" : email_v ])
                SVProgressHUD.dismiss()
//go to home 
                self.performSegue(withIdentifier: "postuploadcompleted_goback", sender:self)
            })
            {(error) in
                SVProgressHUD.dismiss()
//show some error
            }

        }else{
            SVProgressHUD.dismiss()
//show some error
        }
    }

}
