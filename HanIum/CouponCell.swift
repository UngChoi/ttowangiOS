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
    var coupon = 0
    
    
    @IBAction func useCoupon(_ sender: AnyObject) {
        print("쿠폰사용")
        me.couponList.useCoupon(coupon)
        couponButton.isEnabled = false;
    }
    
    
    func setCouponNumTo(_ couponNum: Int){
        coupon = couponNum
    }
}
