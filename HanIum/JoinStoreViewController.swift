//
//  JoinStoreViewController.swift
//  HanIum
//
//  Created by rentdotcom on 2016. 7. 23..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

var store = StoreDAO.sharedInstance()
class JoinStoreViewController: UIViewController {

    @IBOutlet weak var StoreNameTextField: UITextField!
    @IBOutlet weak var storeNumberTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    }
    
    //신청하기 버튼 action 처리
    @IBAction func applyStore(sender: AnyObject) {
        guard let storeInfo = newStore() else {
            self.dismissViewControllerAnimated(true, completion: nil)
            return
        }
        store.addNewStore(storeInfo)
        print(store.returnListCount())
    }
    // textField에서 값가져와서 새로운 StoreEntity생성
    func newStore() -> StoreEntity?{
        
        let storeName = StoreNameTextField.text!
        if storeName.isEmpty{
            return nil
        }
        
        let storeNumber = storeNumberTextField.text!
        if storeNumber.isEmpty{
            return nil
        }
        
        let store = StoreEntity(storeName: storeName, storeNumber: storeNumber)
        
        return store
    }
}
