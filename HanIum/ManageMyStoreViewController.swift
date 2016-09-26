//
//  ManageMyStoreViewController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 8. 16..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class ManageMyStoreViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var myStorePicker: UIPickerView!
     let pickOption = ["starbucks", "cofferBean", "GongCha", "ilsang", "hollys"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myStorePicker.delegate = self
        myStorePicker.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return pickOption[row]
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
