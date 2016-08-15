//
//  CouponCell.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 23..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

class CouponCell: UITableViewCell {
    
    @IBOutlet weak var couponImage: UIImageView!
    @IBOutlet weak var couponNum: UILabel!
    @IBOutlet weak var couponButton: UIButton!
    var coupon = ""
    
    
    @IBAction func useCoupon(sender: AnyObject) {
        print("쿠폰사용")
        me?.couponList.useCoupon(coupon)
        couponButton.enabled = false;
    }
    
    
    func setCouponNumTo(couponNum: String){
        coupon = couponNum
    }
}