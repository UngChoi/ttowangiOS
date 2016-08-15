//
//  UserDAO.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation

class UserDAO {
    struct StaticInstance {
        static var instance: UserDAO?
    }
    
    class func sharedInstance() -> UserDAO {
        if (StaticInstance.instance == nil) {
            StaticInstance.instance = UserDAO()
        }
        return StaticInstance.instance!
    }
    var userList : [UserEntity]
    
    init(){
        self.userList = []
    }
    func addNewItem(){
        var temp : UserEntity
        temp = UserEntity(name:"최웅규", phone:"010-5532-6592", birth:NSDate(), gender:true, code:1, email:"shs7575@gmail.com");
        
        self.userList.append(temp)
    }
    func addNewItem(user:UserEntity){
        userList.append(user)
    }
    func searchUserName(name:String) -> UserEntity? {
        for i in 0..<userList.count {
            if(name == userList[i].name){
                return userList[i]
            }
        }
        return nil
    }
    func searchUserId(id:String) -> UserEntity? {
        for i in 0..<userList.count {
            if(id == userList[i].id){
                return userList[i]
            }
        }
        return nil
    }
    
    func returnListCount() -> Int {
        return userList.count
    }
    
    func modifyUserInfoName(sName : String, phone : String, name : String, email : String) -> Bool {
        var user = self.searchUserName(sName)
        if user == nil {
            return false
        }
        user?.phone = phone
        user?.name = name
        user?.email = email
        return true
    }
    
    func modifyUserInfoID(id : String, phone : String, name : String, email : String) -> Bool {
        var user = self.searchUserId(id)
        if user == nil {
            return false
        }
        user?.phone = phone
        user?.name = name
        user?.email = email
        return true
    }
    
}