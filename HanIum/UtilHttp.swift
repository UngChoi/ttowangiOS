//
//  UtilHttp.swift
//  HanIum
//
//  Created by rentdotcom on 2016. 8. 15..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import Foundation
import UIKit



class Util{
    
    func isStringEmpty(_ stringValue:String) -> Bool
    {
        var stringValue = stringValue
        var returnValue = false
        
        if stringValue.isEmpty  == true{
            
            returnValue = true
            return returnValue
        }
        
        stringValue = stringValue.trimmingCharacters(in: CharacterSet.whitespaces)
        
        if(stringValue.isEmpty == true){
            
            returnValue = true
            return returnValue
        }
        
        return returnValue
    }
    func joinNewUser(_ phone:String, name:String, birth:Date, genderBool:Bool, email:String ) {
        
        let myUrl = URL(string: "http://14.63.213.208:8080/ttowang/insertUser.do");
        
        let request = NSMutableURLRequest(url:myUrl!)
        var requests = URLRequest(url:myUrl!)
        requests.httpMethod = "POST"
        request.httpMethod = "POST";// Compose a query string
        var gender = ""
        if genderBool{
            gender = "남자"
        }
        else{
            gender = "여자"
        }
        let birthTemp = birth.description
        let birthString = birthTemp[birthTemp.characters.index(birthTemp.startIndex, offsetBy: 2)...birthTemp.characters.index(birthTemp.startIndex, offsetBy: 3)] + birthTemp[birthTemp.characters.index(birthTemp.startIndex, offsetBy: 5)...birthTemp.characters.index(birthTemp.startIndex, offsetBy: 6)] + birthTemp[birthTemp.characters.index(birthTemp.startIndex, offsetBy: 8)...birthTemp.characters.index(birthTemp.startIndex, offsetBy: 9)]
        
        let postString = "userTel=\(phone)&userName=\(name)&userBirth=\(birthString)&userGender=\(gender)&userEmail=\(email)";
        print(postString)
        request.httpBody = postString.data(using: String.Encoding.utf8);
        requests.httpBody = postString.data(using: String.Encoding.utf8);
        let task = URLSession.shared.dataTask(with: requests, completionHandler: {data, response, error in
            if error != nil{
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
        })
        task.resume()
    }


    
    func searchUser(_ phone:String) -> UserEntity {
        print("서버에서불러옴")
        let myUrl = URL(string: "http://14.63.213.208:8080/ttowang/checkUser.do");
        
        let request = NSMutableURLRequest(url:myUrl!);
        request.httpMethod = "POST";// Compose a query string

        
        
        let postString = "userTel=\(phone)";
        
        var user = UserEntity()
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
//        print(request.HTTPBody?.description)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            data, response, error in
            if error != nil{
                
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8)
//            print("responseString = \(responseString!)")
            do {
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                
                if let datas = myJSON!["checkUser"] as? [[String: AnyObject]] {
                    for data in datas {
                
//                        print(data)
                        if let id = data["userId"] as? Int {
                            user.id = id
                        }
                        else { return }
                        
                        if let tel = data["userTel"] as? String{
                            user.phone = tel
                        }   else {return}
                        
                        if let name  = data["userName" ] as? String{
                            user.name = name
                        }   else {return}
                        
                        if var birth  = data["userBirth"] as? String {
                           birth = "19"+birth
                            let format = DateFormatter()
                            format.dateFormat = "yyyyMMdd"
                            let birthDate = format.date(from: birth)
                            user.birth = birthDate!
                        } else{return}
                        
                        if let gender = data["userGender"] as? String {
                            if gender == "남성" {
                                user.gender = true
                            }
                            else {
                                user.gender = false
                            }
                        }
                        else {return}
                        
                            
                        if let code = data["userCode"] as? Int{
                            user.code = code
                        }else {return}
                        
                        if let email  = data["userEmail"] as? String {
                           user.email = email
                        }
                        else {
                           user.email = ""
                        }
                        
                       
                    }
                    print("\(user.id), \(user.phone), \(user.name)!!!!!")
                    
                }
                
            } catch {print(error)}
            
        }) 
        
        task.resume()
        while(true) {
            if user.id != 0 {
                break;
            }
        }
//        print("\(user.id), \(user.phone), \(user.name)개씨발 이게 뭐야 ")
        user.stampList = self.loadCouponStampList(user.id).0
        user.couponList = self.loadCouponStampList(user.id).1
        print(user.stampList.count)
        return user
    }
    
    func loadCouponStampList(_ userID : Int) -> ([StampList],CouponList){
        let myUrl = URL(string: "http://14.63.213.208:8080/ttowang/selectMyBusinesses.do");
        
        let request = NSMutableURLRequest(url:myUrl!);
        request.httpMethod = "POST";// Compose a query string
        
        let postString = "USERID=\(userID)";
//        let postString = "USERID=2";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        print(postString)
        var stampList : [StampList] = []
        var couponList : CouponList = CouponList()
        var stampI = 0
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
                        data, response, error in
            
            if error != nil{
            
                print("error=\(error)")
                return
            }
            
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            print(responseString)
            
            
            do {
                let myJSON =  try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
            
                if let datas = myJSON!["list"] as? [[String: AnyObject]] {
                    stampI = datas.count
                    print(stampI)
                    for data in datas {
//                        print(data)
                        let businessName = data["businessName"] as? String
//                        print(businessName)
                        let businessId = data["businessId"] as? Int
//                        print(businessId)
                        let businessAddress  = data["businessAddress" ] as? String
//                        print(businessAddress)
                        let stampCount = data["stampCount"] as? Int
//                        print(stampCount)
                        let photoName = data["photoName"] as? String
//                        print(photoName)
                        let totalStampCount = data["totalStampCount"] as? Int
//                        print(totalStampCount)
                        
                        let image = self.getImage(photoName!)
                        
//                       print("\(self.getStampNeed(businessId!))123123")
                        let stamp : StampList = StampList(storeID: businessId!, storeName : businessName!, storeAddress : businessAddress!,stampCnt: totalStampCount!, canStampCnt: stampCount!,storeImages: image)
                        stampList.append(stamp)
//                        stampI = stampI+1
                    }
                }
                if let datas = myJSON!["coupon"] as? [[String: AnyObject]] {
                    for data in datas {
                        print(data)
                        let couponNum = data["couponNum"] as? Int
                        print(couponNum)
                        let couponUse = data["couponUse"] as? Int
//                        print(couponUse)
                        let couponCode  = data["couponCode" ] as? Int
                        print(couponCode)
                        let businessId = data["businessId"] as? Int
//                        print(businessId)
                        let couponName = data["couponName"] as? String
                        print(couponName)
                        
                        
                        let coupon = CouponEntity(couponName : couponName!, couponStoreId : businessId!, couponNum : couponNum!, isUsed : couponUse!, stampNeed: couponCode!)
                        couponList.addCoupon(coupon)
//                        print(couponName)
//                        let coupon = CouponEntity(couponName: couponName, couponStoreId: businessId, phone: String, stampNeed: <#T##Int#>, couponCnt: <#T##Int#>)
                    }
                }
            
            } catch {print(error)}
        }) 
        
        task.resume()
        while(true){
            if(stampI != 0){
//                print("\(stampList.count) \(stampI) !@#")
                if( stampList.count == stampI)  {break}
            }
        }
//        print("\(stampList) \(stampI) !@#")
        for name in stampList {
            print("\(name.storeName) \(name.stampCnt) \(name.canStampCnt)")
        }
        return (stampList, couponList)
    }
//    func receiveDataBusinessList() {
//
//        let myUrl = NSURL(string: "http://192.168.21.118:8080/ttowang/businessList.do");
//        
//        let request = NSMutableURLRequest(URL:myUrl!);
//        request.HTTPMethod = "POST";// Compose a query string
//        
//        let postString = "";
//        
//        request.HTTPBody = postString.dataUsingEncoding(NSUTF8StringEncoding);
//        
//        let task = NSURLSession.sharedSession().dataTaskWithRequest(request) {
//            data, response, error in
//            
//            if error != nil{
//                
//                print("error=\(error)")
//                return
//            }
//
//            let responseString = NSString(data: data!, encoding: NSUTF8StringEncoding)
//            //            print("responseString = \(responseString!)")
//            var licenses = [String]()
//            
//            do {
//                let myJSON =  try NSJSONSerialization.JSONObjectWithData(data!, options: .MutableContainers) as? NSDictionary
//                
//                if let datas = myJSON!["businessList"] as? [[String: AnyObject]] {
//                    for data in datas {
//
//                        
//                        let name = data["businessName"] as? String
//                        let time = data["businessTime"] as? String
//                        let tel  = data["businessTel" ] as? String
//                        
//                        let address  = data["businessAddress"] as? String
//                        let menu     = data["businessMenu"] as? String
//                        let id       = data["businessId"] as? String
//                        let benefit  = data["businessBenefit"] as? String
//                        let photo    = data["photoName"] as? String
//                        let info     = data["businessInfo"] as? String
//                        
//
//                        busniess.append(BusinessEntity(businessId: id!, businessName: name!, name: name!, businessTel: tel!, businessTime: time!, businessAddress: address!, businessMenu: menu!, businessBenefit: benefit!, photoName: photo!, lat: String(37.564747), lng: String(126.939602), stampCount: 11, businessInfo: info!, kind: "cafe", heart: false))
//                        
//                    }
//                }
//
//            } catch {print(error)}
//        }
//        task.resume()
//    }
    func getImage(_ photoName:String) -> UIImage{
        
        let url = "http://14.63.213.208:8080/ttowang/image/"
        let imageUrl = url+photoName
        var image:UIImage?
        
        if let url = URL(string: imageUrl) {
            if let data = try? Foundation.Data(contentsOf: url) {
                image =  UIImage(data: data)!
            }
        }
        
        return image!
    }
    func getStampNeed(_ bussinessId : Int) -> Int {
        let myUrl = URL(string:"http://14.63.213.208:8080/ttowang/couponView.do")
        let request = NSMutableURLRequest(url:myUrl!);
        request.httpMethod = "POST";// Compose a query string
        let postString = "businessId=\(bussinessId)";
        request.httpBody = postString.data(using: String.Encoding.utf8);
        
//        print(postString)
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: {
            data, response, error in
            if error != nil{
                
                print("error=\(error)")
                return
            }
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8)
            print("\(responseString)!@#!@#")
        }) 
        task.resume()
        print("끝")
        return 0
    }
}
