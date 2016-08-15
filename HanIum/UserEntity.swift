//
//  UserEntity.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class UserEntity {
    var id : String
    var phone : String
    var name : String
    var birth : NSDate
    var gender : Bool
    var code : Int
    var email : String
    var storeList : [StoreEntity] = []
    var stampList : [StampList] = []
    var couponList : CouponList = CouponList()
    
    init() {
        self.id = "no id"
        self.name = "no name"
        self.phone = "no phone"
        self.birth = NSDate()
        self.gender = true
        self.code = 0
        self.email = "no email"
    }
    convenience init(phone:String) {
        self.init()
        self.id = "1"
        self.phone = phone
    }
    convenience init(phone:String, name:String, birth:NSDate, gender:Bool, email:String){
        self.init(phone: phone)
        self.name = name
        self.birth = birth
        self.gender = gender
        self.code = 1
        self.email = email
        for _ in 0..<11{
            self.giveStamp("1", stamp: StampEntity(num: 1,date: NSDate()),tempStoreNeed: 30)
        }
        for _ in 0..<16{
            self.giveStamp("2", stamp: StampEntity(num: 1,date: NSDate()),tempStoreNeed: 20)
        }
        for _ in 0..<23{
            self.giveStamp("3", stamp: StampEntity(num: 1,date: NSDate()),tempStoreNeed: 25)
        }
        let coupon = CouponEntity(couponName: "?", couponStoreId: "3", phone: phone, stampNeed: 10, couponCnt: couponList.couponCnt+1)
        coupon.couponImg = "starbucksCard"
        couponList.addCoupon(coupon)
        self.stampList[0].storeImage = "starbucksCard"
        self.stampList[1].storeImage = "hollys"
        self.stampList[2].storeImage = "coffeebean"
    }
    convenience init(name:String, phone:String, birth:NSDate, gender:Bool, code:Int, email:String){
        self.init(phone: phone)
        self.name = name
        self.birth = birth
        self.gender = gender
        self.code = code
        self.email = email
    }
    convenience init(name:String, phone:String, birth:NSDate, gender:Bool, code:Int){
        self.init(phone: phone)
        self.name = name
        self.birth = birth
        self.gender = gender
        self.code = code
    }
    
    func giveStamp(storeID : String, stamp : StampEntity){
        let isHave = self.getStampIndex(storeID)
        
        if isHave == -1 {
            let newStamp = StampList(storeID:storeID)
            newStamp.addStamp(stamp)
            stampList.append(newStamp)
        }
        else {
            stampList[isHave].addStamp(stamp)
        }
    }
    
    func giveStamp(storeID : String, stamp : StampEntity, tempStoreNeed : Int){
        let isHave = self.getStampIndex(storeID)
        
        if isHave == -1 {
            let newStamp = StampList(storeID:storeID, needCoupon: tempStoreNeed) //임시로 쿠폰에 필요한 스탬프 박음
            
            newStamp.addStamp(stamp)
            stampList.append(newStamp)
        }
        else {
            stampList[isHave].addStamp(stamp)
        }
    }
    // 스탬프 추가 메소드
    
    func giveStamp(storeIndex : Int, storeID : String, stamp : StampEntity){
        if storeIndex >= stampList.count {
            let newStamp = StampList(storeID:storeID) //임시로 쿠폰에 필요한 스탬프 박음
            newStamp.addStamp(stamp)
            stampList.append(newStamp)
        }
        else {
            stampList[storeIndex].addStamp(stamp)
        }
    }
    // 스탬프 추가 메소드
    
    func giveStamp(storeIndex : Int, storeID : String, stamp : StampEntity, tempStoreNeed : Int){
        if storeIndex >= stampList.count {
            let newStamp = StampList(storeID:storeID, needCoupon: tempStoreNeed) //임시로 쿠폰에 필요한 스탬프 박음
            newStamp.addStamp(stamp)
            stampList.append(newStamp)
        }
        else {
            stampList[storeIndex].addStamp(stamp)
        }
    }
    // 스탬프 추가 메소드
    
    func getStampIndex(storeID : String) -> Int {
        var isHave = -1
        for i in 0..<stampList.count {
            if(storeID == stampList[i].storeID){
                isHave = i
                break
            }
            
        }
        return isHave
    }//적립하려는 스토어가 있는지 없는지 확인하는 메소드
    
    func changeStampToCoupon(storeID : String, changeNum : Int){
        var isChange = 0
        var a = 0
        for i in 0..<stampList.count {
            if(storeID == stampList[i].storeID){
                isChange = stampList[i].changeCoupon(changeNum)
                a = i
                break
            }
        }
        if isChange == 0 {
            let coupon = CouponEntity(couponName: "?", couponStoreId: storeID, phone: phone, stampNeed: changeNum, couponCnt: couponList.couponCnt+1)
            coupon.couponImg = stampList[a].storeImage
            print(coupon.isUsed)
            couponList.addCoupon(coupon)
        }
    }
    
    func useCoupon(couponNum : String) {
    couponList.useCoupon(couponNum)
    }
    
}