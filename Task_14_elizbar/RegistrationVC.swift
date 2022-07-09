//
//  RegistrationVC.swift
//  Task_14_elizbar
//
//  Created by alta on 7/9/22.
//


import UIKit
protocol RegistrationCompleteDelegate {
    func didRegister(name: String, email : String , password: String)
}
class RegistrationVC: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var repeatPass: UITextField!
    
    var delegate : RegistrationCompleteDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    
    
    
    @IBAction func completeRegBtn(_ sender: Any) {
        if registrationValidation(userName: userName.text!, mail: email.text! , passWord: passWord.text!, passAgain: repeatPass.text!, vc: self) == true {
            delegate.didRegister(name: userName.text!, email: email.text!, password: passWord.text!)
            self.navigationController?.popToRootViewController(animated: true)
        }

        

        
    }
    


}
