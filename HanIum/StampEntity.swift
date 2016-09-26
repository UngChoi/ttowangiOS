//
//  StampEntity.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class StampEntity {
    var num : Int
    var date : Date
    var isUsed : Bool
    
    init(){
        num = 0
        date = Date()
        isUsed = true
    }
    
    init(num : Int, date : Date){
        self.num = num
        self.date = date
        self.isUsed = false
    }
    init(num : Int, date : Date, isUsed : Bool){
        self.num = num
        self.date = date
        self.isUsed = isUsed
    }
    func useStamp() -> Bool {
        if isUsed {
            isUsed = false
            return true
        }
        else{
            return false
        }
        
    }
}
