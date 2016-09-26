//
//  StampList.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation
import UIKit

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
    
    var storeID : Int
    var storeName : String
    var storeAddress : String
    var stampCnt : Int
    var canStampCnt : Int
    var stamps : [StampEntity] = []
    var storeImage : String = ""
    var needCoupon : Int
    var storeImages : UIImage = UIImage()
    
    
    init(){
        storeID = 0
        storeAddress = ""
        storeName = ""
        stampCnt = 0
        canStampCnt = 0
        needCoupon = 0
    }
    init(storeID : Int){
        
        self.storeID = storeID
        stampCnt = stamps.count
        storeAddress = ""
        storeName = ""
        canStampCnt = 0
        needCoupon = 0
    }
    
    init(storeID : Int, needCoupon : Int){
        self.storeID = storeID
        stampCnt = stamps.count
        canStampCnt = 0
        self.needCoupon = needCoupon
        storeAddress = ""
        storeName = ""
    }
    
    init(storeID : Int, storeImage : String, needCoupon : Int){
        self.storeID = storeID
        stampCnt = stamps.count
        canStampCnt = 0
        self.needCoupon = needCoupon
        self.storeImage = storeImage
        storeAddress = ""
        storeName = ""
    }
    
    init(storeID : Int, storeName : String, storeAddress : String, stampCnt : Int, canStampCnt : Int,storeImages : UIImage){
        self.storeID = storeID
        self.canStampCnt = canStampCnt
        self.stampCnt = stampCnt
        self.storeImages = storeImages
        self.storeAddress = storeAddress
        self.storeName = storeName
        needCoupon = 0
        for i in 0..<stampCnt-canStampCnt {
            stamps.append(StampEntity(num: i,date: Date(),isUsed: true))
        }
        for i in 0..<canStampCnt {
            stamps.append(StampEntity(num: i+stampCnt-canStampCnt,date: Date(),isUsed: false))
        }
        self.setCanUseStamp()
    }
    init(storeID : Int, storeName : String, storeAddress : String, stampCnt : Int, canStampCnt : Int,storeImages : UIImage, needCoupon : Int){
        self.storeID = storeID
        self.canStampCnt = canStampCnt
        self.stampCnt = stampCnt
        self.storeImages = storeImages
        self.storeAddress = storeAddress
        self.storeName = storeName
        self.needCoupon = needCoupon
        for i in 0..<stampCnt-canStampCnt {
            stamps.append(StampEntity(num: i,date: Date(),isUsed: true))
        }
        for i in 0..<canStampCnt {
            stamps.append(StampEntity(num: i+stampCnt-canStampCnt,date: Date(),isUsed: false))
        }
        self.setCanUseStamp()
    }
    func addStamp(_ stamp : StampEntity){
        stamps.append(stamp)
        stampCnt = stampCnt + 1
        setCanUseStamp()
    }
    
    func changeCoupon(_ changeNum : Int) -> Int{
//        print("사용가능 스탬프 : \(canStampCnt)")
//        print("스탬프필요 : \(changeNum)")
        if(canStampCnt < changeNum){
            return changeNum - canStampCnt
        }
        let startIndex = self.getStartIndex()
        for i in startIndex..<startIndex+changeNum {
            stamps[i].isUsed = true
        }
        setCanUseStamp()
//        print("바뀐사용가능 스탬프 : \(canStampCnt)")
        //print("쿠폰사용")
        return 0
    }
    
    func setCanUseStamp() -> Int{
        let startIndex = getStartIndex()
        //        print(startIndex)
//        print("총스탬프 \(stamps.count) \(startIndex)")
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
