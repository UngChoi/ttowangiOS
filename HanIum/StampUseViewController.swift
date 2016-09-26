//
//  StampUseViewController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 21..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

var presentStoreID = 0

class StampUseViewController: UIViewController {

//    @IBOutlet weak var storeNameField: UITextField!
    
    @IBOutlet weak var couponChangeButton: UIButton!
    @IBOutlet weak var giftButton: UIButton!
    @IBOutlet weak var stampScrollView: UIScrollView!
    @IBOutlet weak var upUIView: UIView!
    var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("여기도")
//        person = util.searchUser("01035620378")
//       print(util.loadCouponStampList(person.id))
        couponChangeButton.layer.borderColor = UIColor.white.cgColor
        couponChangeButton.layer.cornerRadius = 10.0
        couponChangeButton.clipsToBounds = true
        couponChangeButton.layer.masksToBounds = true
        giftButton.layer.borderColor = UIColor.white.cgColor
        giftButton.layer.cornerRadius = 10.0
        giftButton.clipsToBounds = true
        giftButton.layer.masksToBounds = true
//        print("???")
        if(me.stampList.count<=0){
            return
        }
        let count = me.stampList[storeIndex].needCoupon
        print(count)
        drawStamps(count);
        //giftButton.layer.cornerRadius = 1.0 * giftButton.bounds.size.width
//        print(storeIndex)
        // Do any additional setup after loading the view.
        print("죽나?")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateItem() {
        let count = me.stampList[storeIndex].needCoupon
        drawStamps(count);
        print(count)
    }
    
    func drawStamps(_ stampNeed : Int) {
        var count = me.stampList[storeIndex].canStampCnt
        //        upUIView.
//        print("count : \(count)씨발놈아??")
//         print("\(me.name) \(me.phone) \(me.birth) \(me.gender)!@!@!@@!!@")
        for view in upUIView.subviews{
            view.removeFromSuperview()
        }
        var scrollViewHeight = 0
        var stampNeeds = 10
        if stampNeeds <= count {
            stampNeeds = count
        }
        for i in 0..<(stampNeeds/5) {
            for j in 0..<5{
                
                if count > 0 {
                    self.imageView = UIImageView(image: UIImage(named: "check.png"))
                    count = count - 1
                    //                    scrollViewHeight = 30+58*(i+1)
                }
                else{
                    self.imageView = UIImageView(image: UIImage(named: "nocheck.png"))
                }
                imageView.frame = CGRect(x: (69*j), y: (58*i), width: 50, height: 50)
                upUIView.addSubview(imageView)
                
                
            }
        }
        scrollViewHeight = 30+58*(stampNeeds/5+1)
        stampScrollView.contentSize = CGSize(width: 353.0, height: Double(scrollViewHeight-80))
        
    }
    
//    @IBAction func stampButton(sender: AnyObject) {
////        presentStoreID = (me?.stampList[storeIndex].storeID)!
////        me!.giveStamp("1", stamp : StampEntity(num: 1,date: NSDate()))
////        me!.giveStamp(storeIndex,storeID: storeNameField.text!, stamp : StampEntity(num: 1,date: NSDate()))
//        if storeNameField.text!.isEmpty {
//            me.giveStamp(storeIndex, storeID : Int(storeNameField.text!)!, stamp : StampEntity(num: 1,date: NSDate()))
//        }
//        else {
//            let myIndex = me.getStampIndex(Int(storeNameField.text!)!)
//            if myIndex == -1 {
//                me.giveStamp(Int(storeNameField.text!)!, stamp: StampEntity(num: 1,date: NSDate()))
//            }
//            else {
//                me.giveStamp(myIndex, storeID : Int(storeNameField.text!)!, stamp : StampEntity(num: 1,date: NSDate()))
//            }
//            print("종이몇장? :\(me.stampList.count)")
//            for i in 0..<me.stampList.count {
//                
//                print("스탬프누적 : \(storeIndex) \(me.stampList[i].stampCnt)")
//                print("몇개 : \(storeIndex) \(me.stampList[i].setCanUseStamp())")
//                
//            }
//        }
//    }
    
    @IBAction func couponChangeButton(_ sender: AnyObject) {
        presentStoreID = (me.stampList[storeIndex].storeID)
        print("가게번호  \(presentStoreID)")
        me.changeStampToCoupon(presentStoreID, changeNum: 10)
//        print("종이몇장? :\(me!.stampList.count)")
        for i in 0..<me.stampList.count {
            print("스탬프누적 : \(storeIndex) \(me.stampList[i].stampCnt)")
            print("몇개 : \(storeIndex) \(me.stampList[i].setCanUseStamp())")
        }
        print("쿠폰의 갯수 \(me.couponList.couponCnt)")
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        storeNameField.resignFirstResponder()

        //화면 터치했을 때 키보드 접는 메소드
    }
}
