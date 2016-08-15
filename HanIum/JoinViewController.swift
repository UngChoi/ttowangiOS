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


class JoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

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
            self.performSegueWithIdentifier("StoreSegue", sender: self)
        }
        genderPick.delegate = self
        genderPick.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinApp(sender: AnyObject) {
        guard let userInfo = newUser() else {
            self.dismissViewControllerAnimated(true, completion: nil)
            
            return
        }
        member.addNewItem(userInfo)
        //print(member.returnListCount())
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
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return array[row]
    }
    // 총 갯수
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return array.count
    }
    // 몇개씩 보여줄꺼냐?
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    // 선택한 Array의 row값을 가져오기 위해서 초기값인 selectRow에 해당 row를 가져옴
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectRow = row
    }
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
 
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        phoneField.resignFirstResponder()
        nameField.resignFirstResponder()
        emailField.resignFirstResponder()
        //화면 터치했을 때 키보드 접는 메소드
    }

}
