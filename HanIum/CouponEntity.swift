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
    var couponNum : Int
    var couponStoreId : Int
    var couponName : String
    var stampNeed : Int
    var isUsed : Int
    
    var couponImg : String = ""
    
    init() {
        self.couponName = ""
        self.couponStoreId = 0
        self.couponNum = 0
        self.stampNeed = 1
        self.isUsed = 0
        
    }
    
    init(couponName : String, couponStoreId :Int, phone : String, stampNeed : Int, couponCnt : Int) {
        
        self.couponName = couponName
        self.couponStoreId = couponStoreId
        self.stampNeed = stampNeed
        isUsed = 1
        self.couponNum = 0
    }
    init(couponName : String, couponStoreId :Int, couponNum : Int,phone : String, stampNeed : Int, couponCnt : Int, isUsed : Int) {
        
        self.couponName = couponName
        self.couponStoreId = couponStoreId
        self.stampNeed = stampNeed
        self.isUsed = isUsed
        self.couponNum = couponNum
    }
    init(couponName : String, couponStoreId : Int, couponNum : Int, isUsed : Int, stampNeed : Int){
        self.couponName = couponName
        self.couponStoreId = couponStoreId
        self.isUsed = isUsed
        self.couponNum = couponNum
        self.stampNeed = stampNeed
    }
//    init(couponNum)
    
}