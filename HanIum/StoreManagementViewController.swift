//
//  StoreManagementViewController.swift
//  HanIum
//
//  Created by rentdotcom on 2016. 7. 23..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class StoreManagementViewController: UIViewController {
    
    @IBOutlet weak var storeNumberLabel: UILabel!
    @IBOutlet weak var storeNameTextField: UITextField!
    @IBOutlet weak var phoneNumberTextField: UITextField!
    @IBOutlet weak var openingHourTextField: UITextField!
    @IBOutlet weak var stampCountTextField: UITextField!
    @IBOutlet weak var benefitTextField: UITextField!
    @IBOutlet weak var informationTextView: UITextView!
    @IBOutlet weak var menuTextView: UITextView!
  
    var storeSegue = store.searchStoreNumber("114-86-59541")//segue로 수정해야되는 코드
    
    override func viewDidLoad() {
        super.viewDidLoad()
        storeNumberLabel.text   =  storeSegue?.storeNumber
        storeNameTextField.text =  storeSegue?.storeName
        
        // navigation 상단에 그림 추가
        let logo = UIImage(named: "logo_3")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
        
        
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func makeInUpdateInformation() -> StoreEntity?{
        let updateStore = StoreEntity()
        
        let number = storeNumberLabel.text!
        if number.isEmpty{
            return nil
        }
        
        let name = storeNameTextField.text!
        if name.isEmpty{
            return nil
        }
        
        let phone = phoneNumberTextField.text!
        if phone.isEmpty{
            return nil
        }
        
        let time = openingHourTextField.text!
        if time.isEmpty{
            return nil
        }
        let stamp = stampCountTextField.text!
        if stamp.isEmpty{
            return nil
        }
        let benefit = benefitTextField.text!
        if benefit.isEmpty{
            return nil
        }
        
        guard let info = informationTextView.text else{
            return nil
        }
        guard let menu = menuTextView.text else{
            return nil
        }
        
        updateStore.storeNumber = number
        updateStore.storeName   = name
        updateStore.time        = time
        updateStore.stampCount  = Int(stamp)!
        updateStore.benefit     = benefit
        updateStore.phone       = phone
        updateStore.info        = info
        updateStore.menu        = menu
        return updateStore
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
        
        if segue.identifier == "Done"{
            guard let updateStore = makeInUpdateInformation(), storeInformationVC = segue.destinationViewController as? StoreInformationViewController else {
                return
            }
            
            storeInformationVC.updateStore(updateStore)
        }
    }
}
