//
//  StampList.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class StampList {
    struct StaticInstance {
        static var instance: UserDAO?
    }
    
    class func sharedInstance() -> UserDAO {
    if (StaticInstance.instance == nil) {
    StaticInstance.instance = UserDAO()
    }
    return StaticInstance.instance!
    }
    
    var storeID : String
    var stampCnt : Int
    var canStampCnt : Int
    var stamps : [StampEntity] = []
    var storeImage : String = ""
    var needCoupon : Int
    
    init(){
        storeID = ""
        stampCnt = 0
        canStampCnt = 0
        needCoupon = 0
    }
    init(storeID : String){
        self.storeID = storeID
        stampCnt = stamps.count
        canStampCnt = 0
        needCoupon = 0
    }
    
    init(storeID : String, needCoupon : Int){
        self.storeID = storeID
        stampCnt = stamps.count
        canStampCnt = 0
        self.needCoupon = needCoupon
    }
    
    init(storeID : String, storeImage : String, needCoupon : Int){
        self.storeID = storeID
        stampCnt = stamps.count
        canStampCnt = 0
        self.needCoupon = needCoupon
        self.storeImage = storeImage
    }
    
    func addStamp(stamp : StampEntity){
        stamps.append(stamp)
        stampCnt = stampCnt + 1
        setCanUseStamp()
    }
    
    func changeCoupon(changeNum : Int) -> Int{
        print("사용가능 스탬프 : \(canStampCnt)")
        print("스탬프필요 : \(changeNum)")
        if(canStampCnt < changeNum){
            return changeNum - canStampCnt
        }
        let startIndex = self.getStartIndex()
        for i in startIndex..<startIndex+changeNum {
            stamps[i].isUsed = true
        }
        setCanUseStamp()
        print("바뀐사용가능 스탬프 : \(canStampCnt)")
        //print("쿠폰사용")
        return 0
    }
    
    func setCanUseStamp() -> Int{
        let startIndex = getStartIndex()
        //        print(startIndex)
        print("총스탬프 \(stamps.count) \(startIndex)")
        canStampCnt = stamps.count - startIndex
        return canStampCnt
    }
    
    func getStartIndex() -> Int{
        var startIndex = 0
        for i in 0..<stamps.count {
            
            if stamps[i].isUsed==false {
                return startIndex
            }
            startIndex = startIndex + 1
        }
        return startIndex
    }
}