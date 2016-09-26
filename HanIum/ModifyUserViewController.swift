//
//  ModifyUserViewController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 22..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit


//var users = UserDAO.sharedInstance()
//var me = users.searchUserName("최웅규")

class ModifyUserViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var emailField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.text = me.name
        phoneField.text = me.phone
        emailField.text = me.email
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func modification(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        let name = nameField.text!
        let phone = phoneField.text!
        let email = emailField.text!
        if name.isEmpty || phone.isEmpty || email.isEmpty {
            return
        }
        users.modifyUserInfoID(me.id, phone: phone, name: name, email: email)
    }

    @IBAction func cancleModificationprintmeemailc(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
