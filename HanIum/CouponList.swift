//
//  CouponList.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 23..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class CouponList {
    var coupons : [CouponEntity]?
    var couponCnt : Int
    var canUseCouponCnt : Int
    
    init(){
        coupons = []
        couponCnt = 0
        canUseCouponCnt = 0
    }
    
    func addCoupon(coupon : CouponEntity) {
        coupons?.append(coupon)
        couponCnt = couponCnt + 1
        canUseCouponCnt = canUseCouponCnt + 1
    }
    func useCoupon(couponNum : String) -> Bool{
        let couponIndex = self.isCoupon(couponNum)
        if couponIndex == -1 {
            return false
        }
        coupons![couponIndex].isUsed = true
        canUseCouponCnt = canUseCouponCnt - 1
        return true
    }
    
    func isCoupon(couponNum : String) -> Int {
        for i in 0..<coupons!.count {
            if(couponNum == coupons![i].couponNum){
                return i
            }
        }
        return -1
    }
    
}