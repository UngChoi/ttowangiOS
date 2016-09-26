//
//  JoinViewController.swift
//  HanIum
//
//  Created by UngKyu-Choi on 2016. 7. 20..
//  Copyright © 2016년 rentdotcom. All rights reserved.
//

import UIKit

var isLogin : Bool = false
var mode : Bool = true
var util = Util()
var myInfoName = "MyInfo"
var myPhone : String = String()
//var person = util.searchUser(myPhone)

class JoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    var myNameInfo : Array<AnyObject> = []
    var plistPathInDocument:String = String()
    
    @IBOutlet weak var phoneField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var birthField: UIDatePicker!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var genderPick: UIPickerView!
    var array = ["남성", "여성"]
    var selectRow = 1
    
    var member = UserDAO.sharedInstance()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if isLogin {
            self.performSegue(withIdentifier: "StoreSegue", sender: self)
        }
        genderPick.delegate = self
        genderPick.dataSource = self
        
        
        
        
        
        
//        
//        guard let infoURL = NSBundle.mainBundle().URLForResource(myInfoName, withExtension: "plist")
//            else {
//                print("No File")
//                return
//        }
//        if let data = NSMutableArray(contentsOfURL: infoURL){
//            let path = infoURL.path
//            
//            print(data[0])
//            var save = data[0]
//            print(save["userTel"])
//            save.setObject("01055326592", forKey: "userTel")
//            save.setObject(true, forKey: "isLogin")
////            save.writeToURL(infoURL, options: )
//            
//            
//            var fileManager = NSFileManager.defaultManager()
//            print(save["userTel"])
//            save.writeToURL(infoURL, atomically: false)
//            save.writeToFile(infoURL.path!, atomically: false)
//            print(save["userTel"])
//            let resultDictionary = NSMutableArray(contentsOfFile: path!)
//            print("Saved GameData.plist file is --> \(resultDictionary?.description)")
//        }
        
//        if let infoArray = NSArray(contentsOfURL: infoURL){
////            
//            var data : NSDictionary = NSDictionary(contentsOfURL: infoURL)
//            
//            
//            myNameInfo += Array(infoArray)
//            print(infoArray)
//            print("--------------------------------")
//            
//            myNameInfo[0].setObject("01055326592", forKey: "userTel")
////            myNameInfo[0].writeToURL(infoURL, options: true)
//            print(myNameInfo[0]["islogin"])
//            print(myNameInfo[0]["userTel"])
//            print("--------------------------------")
//            print(myNameInfo)
//            print("--------------------------------")
//            
//        }
        // Do any additional setup after loading the view.
        self.saveGameData()
        self.loadGameData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func thorws() {
        
    }
    @IBAction func joinApp(_ sender: AnyObject) {
        guard let userInfo = newUser() else {
            self.dismiss(animated: true, completion: nil)
            
            return
        }
//        util.joinNewUser(userInfo.phone, name: userInfo.name, birth: userInfo.birth, genderBool: userInfo.gender, email: userInfo.email)
        member.addNewItem(userInfo)
//        person = util.searchUser("01035620378")
        
        
    }
    
    func newUser() -> UserEntity? {
        
        let phone = phoneField.text!
        if phone.isEmpty{
            return nil
        }
        let name = nameField.text!
        if name.isEmpty{
            return nil
        }
        
        let gender : Bool
        if(selectRow==0){
            gender = false
        }
        else {
            gender = true
        }
        let birth = birthField.date
        var email = emailField.text!
        if email.isEmpty {
            email = "no email"
        }
        
        let user = UserEntity(phone:phone, name:name, birth:birth, gender:gender, email:email)
        //print("끝")
        return user
    }
    
    // MARK: - Navigation
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    // 총 갯수
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    // 몇개씩 보여줄꺼냐?
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    // 선택한 Array의 row값을 가져오기 위해서 초기값인 selectRow에 해당 row를 가져옴
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRow = row
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
 
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        phoneField.resignFirstResponder()
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        //화면 터치했을 때 키보드 접는 메소드
    }
//    func saveGameData() {
//        
//        let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true) as NSArray
//        let documentsDirectory = paths.objectAtIndex(0) as! NSString
//        let pathe = documentsDirectory.stringByAppendingPathComponent("MyInfo.plist")
////        print(path)
//        let resultDictionaryss = NSMutableDictionary(contentsOfFile: documentsDirectory.stringByAppendingPathComponent("MyInfo.plist"))
////        var dict: NSMutableDictionary = ["XInitializerItem": "DoNotEverChangeMe"]
//        //saving values
//        let infoURL = NSBundle.mainBundle().URLForResource(myInfoName, withExtension: "plist")
//        let path = (infoURL?.path)!
//        
////        print(infoURL?.path)
////        let data = NSMutableArray(contentsOfURL: infoURL!)
////        let data = NSMutableArray(contentsOfFile: (infoURL?.path)!)
//        let data = NSMutableArray(contentsOfFile: path)
//        let datas = NSMutableArray(contentsOfURL: infoURL!)
//        var dict: NSMutableDictionary = data![0] as! NSMutableDictionary
//        var dicts: NSMutableDictionary = datas![0] as! NSMutableDictionary
////        let resultDictionaryss = NSMutableDictionary(contentsOfFile: documentsDirectory.stringByAppendingPathComponent("MyInfo.plist"))
////        print("Saved GameData.plist file is --> \(resultDictionaryss?.description)")
//        print("==================================")
//        
//        print("==================================")
//        dict.setObject("010553265921", forKey: "userTel")
//        dict.setObject(true, forKey: "isLogin")
//        dicts.setObject("0105532659212", forKey: "userTel")
//        dicts.setObject(true, forKey: "isLogin")
//        //...
//        
//        //writing to GameData.plist
//        dict.writeToFile(path, atomically: true)
//        dict.writeToURL(infoURL!, atomically: true)
//        let resultDictionary = NSMutableDictionary(contentsOfURL: infoURL!)
//        let resultDictionarys = NSMutableDictionary(contentsOfFile: documentsDirectory.stringByAppendingPathComponent("MyInfo.plist"))
//        print("Saved GameData.plist file is --> \(resultDictionary?.description)")
//        print("Saved GameData.plist file is --> \(resultDictionarys?.description)")
//    }
    func loadGameData() {
        // getting path to GameData.plist
        
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths[0] as! NSString
        let path = documentsDirectory.appendingPathComponent("MyInfo.plist")
        
        //        let path = documentsDirectory.stringByAppendingPathComponent("GameData.plist")
        let fileManager = FileManager.default
        
        //check if file exists
        if(!fileManager.fileExists(atPath: path))
        {
            // If it doesn't, copy it from the default file in the Bundle
            
            if let bundlePath = Bundle.main.path(forResource: "MyInfo", ofType: "plist")
            {
                let resultDictionary = NSMutableDictionary(contentsOfFile: bundlePath)
//                print("Bundle MyInfo.plist file is --> \(resultDictionary?.description)")
                
                do
                {
                    try fileManager.copyItem(atPath: bundlePath, toPath: path)
//                    print("copy")
                }
                catch _
                {
//                    print("error failed loading data")
                }
            }
            else
            {
//                print("MyInfo.plist not found. Please, make sure it is part of the bundle.")
            }
        }
        else
        {
//            print("MyInfo.plist already exits at path.")
            // use this to delete file from documents directory
            //fileManager.removeItemAtPath(path, error: nil)
        }
        
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
//        print("Loaded MyInfo.plist file is --> \(resultDictionary?.description)")
        let myDict = NSDictionary(contentsOfFile: path)
        var tel : String = String()
        
        if let dict = myDict {
            //loading values
            tel = dict.object(forKey: "userTel")! as! String
            isLogin = dict.object(forKey: "isLogin")! as! Bool
            
            myPhone = tel
            //...
        }
        else
        {
//            print("WARNING: Couldn't create dictionary from GameData.plist! Default values will be used!")
        }
//        print(myDict)
    }//eom
    func saveGameData()
    {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray
        let documentsDirectory = paths.object(at: 0) as! NSString
        let path = documentsDirectory.appendingPathComponent("MyInfo.plist")
        
        let infoURL = Bundle.main.url(forResource: myInfoName, withExtension: "plist")
        let data = NSMutableArray(contentsOf: infoURL!)
        let dict: NSMutableDictionary = data![0] as! NSMutableDictionary
        //saving values
        dict.setObject("01055326592", forKey: "userTel" as NSCopying)
        dict.setObject(true, forKey: "isLogin" as NSCopying)
        //...
        //writing to GameData.plist
        dict.write(toFile: path, atomically: false)
        let resultDictionary = NSMutableDictionary(contentsOfFile: path)
//        print("Saved MyInfo.plist file is --> \(resultDictionary?.description)")
        
        self.loadGameData()
        
    }//eom
}
