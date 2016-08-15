//
//  FullStoreViewController.swift
//  HanIum
//
//  Created by rentdotcom on 2016. 7. 24..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class FullStoreViewController: UIViewController {

    @IBOutlet weak var searchTextField: UITextField!

    @IBOutlet weak var backgroundView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // cornerRadius
        
        backgroundView.layer.cornerRadius = 10.0
        backgroundView.clipsToBounds = true
        backgroundView.layer.masksToBounds = true
        backgroundView.layer.opaque = false;
        //searchTextField.layer.borderColor  = UIColor(hex: "#ff005c").CGColor
        //searchTextField.layer.borderWidth  = 2.0
        //searchTextField.layer.cornerRadius = 2.0 * searchTextField.bounds.size.width
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func searchAction(sender: AnyObject) {
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
