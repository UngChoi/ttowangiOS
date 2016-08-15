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
    var date : NSDate
    var isUsed : Bool
    
    init(){
        num = 0
        date = NSDate()
        isUsed = true
    }
    
    init(num : Int, date : NSDate){
        self.num = num
        self.date = date
        self.isUsed = false
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