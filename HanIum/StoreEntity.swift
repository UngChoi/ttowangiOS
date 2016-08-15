//
//  StoreEntity.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class StoreEntity{
    
    var id          : String
    var storeName   : String
    var storeNumber : String
    var name        : String // ?
    var phone       : String // 연락처
    var info        : String // 설명
    var time        : String // 영업시간
    var address     : String // 주소
    var menu        : String // 메뉴
    var benefit     : String // 혜택
    var photo       : String // 사진
    var lat         : String // 좌표 latitude
    var lng         : String // 좌표 longitude
    var stampCount  : Int    // 스템프 갯수
    
    
    init() {
        self.id          = "no id"
        self.storeName   = "no storeName"
        self.storeNumber = "no storeNumber"
        self.name        = "no name"
        self.phone       = "no phone"
        self.info        = "no info"
        self.time        = "no time"
        self.address     = "no address"
        self.menu        = "no menu"
        self.benefit     = "no benefit"
        self.photo       = "no photo"
        self.lat         = "no lat"
        self.lng         = "no lng"
        self.stampCount  = 10
    }
    convenience init(storeName:String,storeNumber:String){
        self.init()
        self.storeName   = storeName
        self.storeNumber = storeNumber
    }
    convenience init(id:String, storeName:String, storeNumber:String, name:String, phone:String, time:String, address:String, menu:String, benefit:String, photo:String, lat:String, lng:String, stampCount:Int){
        self.init()
        
        self.id          = id
        self.storeName   = storeName
        self.storeNumber = storeNumber
        self.name        = name
        self.phone       = phone
        self.time        = time
        self.address     = address
        self.menu        = menu
        self.benefit     = benefit
        self.photo       = photo
        self.lat         = lat
        self.lng         = lng
        self.stampCount  = stampCount
    }
    
}