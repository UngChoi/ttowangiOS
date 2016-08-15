//
//  CouponEntity.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 23..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class CouponEntity {
    //    static var couponCnt = 0
    var couponNum : String
    var couponStoreId : String
    var couponName : String
    var stampNeed : Int
    var isUsed : Bool
    var couponImg : String = ""
    
    init() {
        self.couponName = ""
        self.couponStoreId = ""
        self.couponNum = ""
        self.stampNeed = 1
        self.isUsed = true
    }
    
    init(couponName : String, couponStoreId :String, phone : String, stampNeed : Int, couponCnt : Int) {
        
        self.couponName = couponName
        self.couponStoreId = couponStoreId
        self.stampNeed = stampNeed
        isUsed = false
        self.couponNum = self.couponStoreId + phone + String(couponCnt)
    }
    
}