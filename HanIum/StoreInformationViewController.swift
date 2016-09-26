//
//  StoreInformationViewController.swift
//  HanIum
//
//  Created by rentdotcom on 2016. 7. 23..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class StoreInformationViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // navigation title 상단에 로고
        let logo = UIImage(named: "logo_3")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @IBAction func unwindToStoreInformation(_ segue:UIStoryboardSegue){
    }
    
    func updateStore(_ storeSegue:StoreEntity){
        print("update")
        store.updateStore(storeSegue)
        store.printStore(storeSegue)
    }
}
