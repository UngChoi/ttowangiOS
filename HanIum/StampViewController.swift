//
//  StampViewController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit
var users = UserDAO.sharedInstance()
//var me = util.searchUser(myPhone)
var me = util.searchUser("01035620378")
//me.setStampList(util.loadCouponStampList(me.id).0)
//me.stampList = util.loadCouponStampList(me.id).0


var storeIndex = 0

//self.stampList[0].storeImage = "starbucksCard"
//self.stampList[1].storeImage = "hollys"
//self.stampList[2].storeImage = "coffeebean"


class StampViewController: UIViewController {
    
    
    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponName: UILabel!
    @IBOutlet weak var stampView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var couponView: UIView!
    @IBOutlet weak var blackBackgroundView: UIView!
    @IBOutlet weak var couponAddress: UILabel!
    @IBOutlet weak var couponCount: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    @IBAction func changedSegment(_ sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            stampView.isHidden = false
            couponView.isHidden = true
        case 1:
            stampView.isHidden = true
            couponView.isHidden = false
        default:
            break; 
        }
        
        couponView.updateConstraints()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        users.addNewItem(me)ut
        
        // navigation title 상단에 로고
        util.loadCouponStampList(me.id)
        let logo = UIImage(named: "logo_3")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView

//        util.searchUser(myPhone)
        //array.sortInPlace { $0.selected && !$1.selected }
        stampView .isHidden = false
        couponView.isHidden = true
//        print(me.stampList.count)
        if me.stampList.count <= 0 {
            couponName.text = "아무것도 없음"
            print("아무것도없는데")
        }
        else {
            
//            let image = me.stampList[storeIndex].storeImage
            couponImage.image = me.stampList[storeIndex].storeImages
            
            couponName.text = me.stampList[storeIndex].storeName
            
            // stores를 stampList로 바꿔야됨
//            let image = stores[storeIndex].image
//            couponImage.image = UIImage(named: image)
//            
//            let storeName = stores[storeIndex].storeName
//            couponName.text = storeName
//            
//            let address = stores[storeIndex].address
//            couponAddress.text = address
//            
//            let count = String(stores[storeIndex].coupon) + " / " + String(stores[storeIndex].totalCoupon)
//            couponCount.text = count
            
            // 윗부분만 둥글게
            let maskLayer = CAShapeLayer()

            maskLayer.path = UIBezierPath(roundedRect: couponImage.bounds, byRoundingCorners: UIRectCorner.topLeft.union(.topRight), cornerRadii: CGSize(width: 10, height: 10)).cgPath
            
            couponImage.layer.mask = maskLayer
            
            // 그림자 부분
            let backLayer = CAShapeLayer()
            
            backLayer.path = UIBezierPath(roundedRect: blackBackgroundView.bounds, byRoundingCorners: UIRectCorner.topLeft.union(.topRight), cornerRadii: CGSize(width: 10, height: 10)).cgPath
            blackBackgroundView.layer.mask = backLayer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func prevCoupon(_ sender: AnyObject) {
        if me.stampList.count < 2 {
            return
        }
        
        storeIndex = (storeIndex+(me.stampList.count)-1) % (me.stampList.count)
        switch self.childViewControllers[0]{
            
        case let itemups as StampUseViewController :
            itemups.updateItem()
            break;
        default :
            print("????????")
            break
        }
        
        
        couponImage.image = me.stampList[storeIndex].storeImages
        
        couponName.text = me.stampList[storeIndex].storeName
        // stores를 stampList로 바꿔야됨
//        let image = stores[storeIndex].image
//        couponImage.image = UIImage(named: image)
//        
//        let storeName = stores[storeIndex].storeName
//        couponName.text = storeName
//        
//        let address = stores[storeIndex].address
//        couponAddress.text = address
//        
//        let count = String(stores[storeIndex].coupon) + " / " + String(stores[storeIndex].totalCoupon)
//        couponCount.text = count
        
        // 윗부분만 둥글게
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: couponImage.bounds, byRoundingCorners: UIRectCorner.topLeft.union(.topRight), cornerRadii: CGSize(width: 10, height: 10)).cgPath
        
        couponImage.layer.mask = maskLayer
        
        // 그림자 부분
        let backLayer = CAShapeLayer()
        
        backLayer.path = UIBezierPath(roundedRect: blackBackgroundView.bounds, byRoundingCorners: UIRectCorner.topLeft.union(.topRight), cornerRadii: CGSize(width: 10, height: 10)).cgPath
        blackBackgroundView.layer.mask = backLayer
        
        //storeIndex = (storeIndex+(me?.stampList.count)!-1) % (me?.stampList.count)!
        //let image = me?.stampList[storeIndex].storeImage
        //couponImage.image = UIImage(named:  image!)
        
        //        print("현재 인덱스 \(storeIndex)")
        //        couponName.text = "이카드는 \((me?.stampList[storeIndex].storeID)!)"
    } //이전 쿠폰 선택
    
    @IBAction func nextCoupon(_ sender: AnyObject) {
        if me.stampList.count < 2 {
            return
        }
        storeIndex = (storeIndex+1)%(me.stampList.count)
        switch self.childViewControllers[0]{
            
        case let itemups as StampUseViewController :
            itemups.updateItem()
            break;
        default :
            print("????????")
            break
        }
        couponImage.image = me.stampList[storeIndex].storeImages
        
        couponName.text = me.stampList[storeIndex].storeName
        // stores를 stampList로 바꿔야됨
//        let image = stores[storeIndex].image
//        couponImage.image = UIImage(named: image)
//
//        let storeName = stores[storeIndex].storeName
//        couponName.text = storeName
//
//        let address = stores[storeIndex].address
//        couponAddress.text = address
//
//        let count = String(stores[storeIndex].coupon) + " / " + String(stores[storeIndex].totalCoupon)
//        couponCount.text = count
        
        // 윗부분만 둥글게
        let maskLayer = CAShapeLayer()
        
        maskLayer.path = UIBezierPath(roundedRect: couponImage.bounds, byRoundingCorners: UIRectCorner.topLeft.union(.topRight), cornerRadii: CGSize(width: 10, height: 10)).cgPath
        
        couponImage.layer.mask = maskLayer
        
        // 그림자 부분
        let backLayer = CAShapeLayer()
        
        backLayer.path = UIBezierPath(roundedRect: blackBackgroundView.bounds, byRoundingCorners: UIRectCorner.topLeft.union(.topRight), cornerRadii: CGSize(width: 10, height: 10)).cgPath
        blackBackgroundView.layer.mask = backLayer

//        storeIndex = (storeIndex+1)%(me?.stampList.count)!
//        let image = me?.stampList[storeIndex].storeImage
//        couponImage.image = UIImage(named:  image!)
        //        couponName.text = "이카드는 \((me?.stampList[storeIndex].storeID)!)"
        //        print("현재 인덱스 \(storeIndex)")
    } //다음 쿠폰 선택
}
