//
//  StoreDAO.swift
//  HanIum
//
//  Created by rentdotcom on 2016. 7. 21..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class StoreDAO{
    
    var storeList : [StoreEntity]
    init(){
        self.storeList = []
    }
    
    struct StaticInstance {
        static var instance: StoreDAO?
    }
    //sharedInstance() 라는 타입메소드가 싱글톤의 팩토리 메소드이다.
    class func sharedInstance() ->StoreDAO{
        if (StaticInstance.instance == nil) {
            StaticInstance.instance = StoreDAO()
        }
        return StaticInstance.instance!
    }
    
    func addNewStore(){
        var temp : StoreEntity
        temp = StoreEntity(storeName: "스타벅스", storeNumber: "124-86-06376")
        self.storeList.append(temp)
    }
    
    func addNewStore(store:StoreEntity){
        storeList.append(store)
    }
    
    func updateStore(updateStore:StoreEntity){
        for i in 0..<storeList.count{
            if updateStore.storeNumber == storeList[i].storeNumber{
                
                storeList[i].storeNumber = updateStore.storeNumber
                storeList[i].storeName   = updateStore.storeName
                storeList[i].phone       = updateStore.phone
                storeList[i].time        = updateStore.time
                storeList[i].stampCount  = updateStore.stampCount
                storeList[i].benefit     = updateStore.benefit
                storeList[i].info        = updateStore.info
                storeList[i].menu        = updateStore.menu
            }
        }
    }
    
    func updateStore(storeNumber:String, storeName:String, phone:String, openHour:String , stampCount:Int, benefit:String, information:String, menu:String){
        for i in 0..<storeList.count{
            if storeNumber == storeList[i].storeNumber{
                
                storeList[i].storeNumber = storeNumber
                storeList[i].storeName   = storeName
                storeList[i].phone       = phone
                storeList[i].time        = openHour
                storeList[i].stampCount  = stampCount
                storeList[i].benefit     = benefit
                storeList[i].info        = information
                storeList[i].menu        = menu
            }
        }
    }
    
    func searchStoreNumber(storeNumber:String) -> StoreEntity?{
        for i in 0..<storeList.count{
            if storeNumber == storeList[i].storeNumber {
                return storeList[i]
            }
        }
        return nil
    }
    
    func searchStoreName(storeName:String) -> StoreEntity?{
        for i in 0..<storeList.count{
            if storeName == storeList[i].storeName {
                return storeList[i]
            }
        }
        return nil
    }
    
    func returnListCount() -> Int {
        return storeList.count
    }
    
    func printStore(target:StoreEntity){
        for i in 0..<storeList.count{
            if target.storeNumber == storeList[i].storeNumber {
                print(target.storeNumber)
                print(target.storeName)
                print(target.phone)
                print(target.time)
                print(target.benefit)
                print(target.menu)
                print(target.info + "\n")
            }
        }
    }
}