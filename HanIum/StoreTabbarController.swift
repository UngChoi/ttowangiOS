//
//  StoreTabbarController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 8. 16..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class StoreTabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.parentViewController?.tabBarController?.tabBar.hidden = true
        //이전의 탭바를 숨기는 코드
        
        self.parentViewController?.navigationController?.navigationBarHidden = true
        switch self.parentViewController{
            
        case let itemups as UINavigationController :
            itemups.navigationBarHidden = true
            break;
        default :
            print("????????")
            break
        }
        //상위 네비게이션바를 지우는 역할
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
