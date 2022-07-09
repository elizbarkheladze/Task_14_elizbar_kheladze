//
//  ViewController.swift
//  Task_14_elizbar
//
//  Created by alta on 7/9/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var userName: UITextField!
    var registeredUsers = [User]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    @IBAction func signUp(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegistrationVC") as? RegistrationVC
        guard let vc = vc else { return }
        vc.delegate = self
        self.navigationController?.pushViewController(vc, animated: true)

        
    }
    @IBAction func logInBtn(_ sender: Any) {
        var currentUser = registeredUsers.filter{$0.username == userName.text! && $0.password == passWord.text!}
        if userName.text!.isEmpty || passWord.text!.isEmpty {
            errorAlert(alert: "fill all fields", vc: self)
        } else if !currentUser.isEmpty{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
            vc?.givenUsername = currentUser[0].username
            vc?.givenEmail = currentUser[0].email
            guard let vc = vc else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            errorAlert(alert: "Either username or password is incorrect", vc: self)
        }
    }
    
}
extension ViewController : RegistrationCompleteDelegate {
    func didRegister(name: String, email: String, password: String) {
        var registeredUser = User(username: name, email: email, password: password)
        registeredUsers.append(registeredUser)
    }
    
    
}

