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
        

        self.parent?.tabBarController?.tabBar.isHidden = true
        //이전의 탭바를 숨기는 코드
        
        self.parent?.navigationController?.isNavigationBarHidden = true
        switch self.parent{
            
        case let itemups as UINavigationController :
            itemups.isNavigationBarHidden = true
            break;
        default :
            print("????????")
            break
        }
        //상위 네비게이션바를 지우는 역할
        
        // Do any additional setup after loading the view.
//        let appearance = UITabBarItem.appearance()
//        let attributes = [NSFontAttributeName:UIFont(name: "American Typewriter", size: 20)]
//        appearance.setTitleTextAttributes(attributes, forState: .Normal)
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
