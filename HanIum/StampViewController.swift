//
//  StampViewController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit
var users = UserDAO.sharedInstance()
var me = users.searchUserName("최웅규")
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

    @IBAction func changedSegment(sender: UISegmentedControl) {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            stampView.hidden = false
            couponView.hidden = true
        case 1:
            stampView.hidden = true
            couponView.hidden = false
        default:
            break; 
        }
        
        couponView.updateConstraints()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigation title 상단에 로고
        let logo = UIImage(named: "logo_3")
        let imageView = UIImageView(image:logo)
        self.navigationItem.titleView = imageView


        //array.sortInPlace { $0.selected && !$1.selected }
        stampView .hidden = false
        couponView.hidden = true
        if me?.stampList.count <= 0 {
            couponName.text = "아무것도 없음"
        }
        else {
            
            let image = me?.stampList[storeIndex].storeImage
            couponImage.image = UIImage(named:image!)
            
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

            maskLayer.path = UIBezierPath(roundedRect: couponImage.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSize(width: 10, height: 10)).CGPath
            
            couponImage.layer.mask = maskLayer
            
            // 그림자 부분
            let backLayer = CAShapeLayer()
            
            backLayer.path = UIBezierPath(roundedRect: blackBackgroundView.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSize(width: 10, height: 10)).CGPath
            blackBackgroundView.layer.mask = backLayer
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func prevCoupon(sender: AnyObject) {
        if me?.stampList.count < 2 {
            return
        }
        
        storeIndex = (storeIndex+(me?.stampList.count)!-1) % (me?.stampList.count)!
        switch self.childViewControllers[0]{
            
        case let itemups as StampUseViewController :
            itemups.updateItem()
            break;
        default :
            print("????????")
            break
        }
        
        
        let image = me?.stampList[storeIndex].storeImage
        couponImage.image = UIImage(named:image!)
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
        
        maskLayer.path = UIBezierPath(roundedRect: couponImage.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSize(width: 10, height: 10)).CGPath
        
        couponImage.layer.mask = maskLayer
        
        // 그림자 부분
        let backLayer = CAShapeLayer()
        
        backLayer.path = UIBezierPath(roundedRect: blackBackgroundView.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSize(width: 10, height: 10)).CGPath
        blackBackgroundView.layer.mask = backLayer
        
        //storeIndex = (storeIndex+(me?.stampList.count)!-1) % (me?.stampList.count)!
        //let image = me?.stampList[storeIndex].storeImage
        //couponImage.image = UIImage(named:  image!)
        
        //        print("현재 인덱스 \(storeIndex)")
        //        couponName.text = "이카드는 \((me?.stampList[storeIndex].storeID)!)"
    } //이전 쿠폰 선택
    
    @IBAction func nextCoupon(sender: AnyObject) {
        if me?.stampList.count < 2 {
            return
        }
        storeIndex = (storeIndex+1)%(me?.stampList.count)!
        switch self.childViewControllers[0]{
            
        case let itemups as StampUseViewController :
            itemups.updateItem()
            break;
        default :
            print("????????")
            break
        }
        let image = me?.stampList[storeIndex].storeImage
        couponImage.image = UIImage(named:image!)
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
        
        maskLayer.path = UIBezierPath(roundedRect: couponImage.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSize(width: 10, height: 10)).CGPath
        
        couponImage.layer.mask = maskLayer
        
        // 그림자 부분
        let backLayer = CAShapeLayer()
        
        backLayer.path = UIBezierPath(roundedRect: blackBackgroundView.bounds, byRoundingCorners: UIRectCorner.TopLeft.union(.TopRight), cornerRadii: CGSize(width: 10, height: 10)).CGPath
        blackBackgroundView.layer.mask = backLayer

//        storeIndex = (storeIndex+1)%(me?.stampList.count)!
//        let image = me?.stampList[storeIndex].storeImage
//        couponImage.image = UIImage(named:  image!)
        //        couponName.text = "이카드는 \((me?.stampList[storeIndex].storeID)!)"
        //        print("현재 인덱스 \(storeIndex)")
    } //다음 쿠폰 선택
}
