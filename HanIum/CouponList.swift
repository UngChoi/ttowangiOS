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
    
    func addCoupon(_ coupon : CouponEntity) {
        coupons?.append(coupon)
        couponCnt = couponCnt + 1
        canUseCouponCnt = canUseCouponCnt + 1
    }
    func useCoupon(_ couponNum : Int) -> Bool{
        let couponIndex = self.isCoupon(couponNum)
        if couponIndex == -1 {
            return false
        }
        coupons![couponIndex].isUsed = 0
        canUseCouponCnt = canUseCouponCnt - 1
        return true
    }
    
    func isCoupon(_ couponNum : Int) -> Int {
        for i in 0..<coupons!.count {
            if(couponNum == coupons![i].couponNum){
                return i
            }
        }
        return -1
    }
    
}
