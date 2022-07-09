//
//  Functions.swift
//  Task_14_elizbar
//
//  Created by alta on 7/9/22.
//

import Foundation
import UIKit
//showing custom alerts
func errorAlert(alert:String , vc : UIViewController){
    var myAlert = UIAlertController(title: "Alert", message: alert, preferredStyle: UIAlertController.Style.alert)
    let alertAction = UIAlertAction(title: "Oh", style: UIAlertAction.Style.default, handler: nil)
    myAlert.addAction(alertAction)
    vc.present(myAlert, animated: true, completion: nil)
}
//email validation using regex
func isValidEmail(testStr:String) -> Bool {
        let emailRegEx = "^(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?(?:(?:(?:[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+(?:\\.[-A-Za-z0-9!#$%&’*+/=?^_'{|}~]+)*)|(?:\"(?:(?:(?:(?: )*(?:(?:[!#-Z^-~]|\\[|\\])|(?:\\\\(?:\\t|[ -~]))))+(?: )*)|(?: )+)\"))(?:@)(?:(?:(?:[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)(?:\\.[A-Za-z0-9](?:[-A-Za-z0-9]{0,61}[A-Za-z0-9])?)*)|(?:\\[(?:(?:(?:(?:(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))\\.){3}(?:[0-9]|(?:[1-9][0-9])|(?:1[0-9][0-9])|(?:2[0-4][0-9])|(?:25[0-5]))))|(?:(?:(?: )*[!-Z^-~])*(?: )*)|(?:[Vv][0-9A-Fa-f]+\\.[-A-Za-z0-9._~!$&'()*+,;=:]+))\\])))(?:(?:(?:(?: )*(?:(?:(?:\\t| )*\\r\\n)?(?:\\t| )+))+(?: )*)|(?: )+)?$"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    let result = emailTest.evaluate(with: testStr)
        return result
    }
//password validation using regex
func validPassword(password:String) -> Bool {
    let passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$"
    let passwordTest = NSPredicate(format:"SELF MATCHES %@", passwordRegex)
    let result = passwordTest.evaluate(with: password)
        return result
}
//validation of registration
func registrationValidation (userName: String, mail : String , passWord : String , passAgain : String , vc : UIViewController) -> Bool{
    if (userName.isEmpty || mail.isEmpty || passWord.isEmpty || passAgain.isEmpty) {
        errorAlert(alert: "You must fill all fields", vc: vc)
        return false
    } else if validPassword(password: passWord) == false {
        errorAlert(alert: "PassWord Too Weak", vc: vc)
        return false
    }
    else if passWord != passAgain {
        errorAlert(alert: "PassWords Do Not Match", vc: vc)
        return false
    }
    else if isValidEmail(testStr:mail) == false {
        errorAlert(alert: "That's not a proprer Email", vc: vc)
        return false
    }

    else if userName.count < 6 {
        errorAlert(alert: "UserName too samll", vc: vc)
        return false
    }
    else if userName.count > 12 {
        errorAlert(alert: "UserName too long", vc: vc)
        return false
    }
    else if passWord.count < 6 {
        errorAlert(alert: "Password Too Short", vc: vc)
        return false
    } else {
        print("aaa")
        return true
    }
    
}
