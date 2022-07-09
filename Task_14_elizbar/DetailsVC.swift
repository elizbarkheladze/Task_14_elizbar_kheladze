//
//  DetailsVC.swift
//  Task_14_elizbar
//
//  Created by alta on 7/9/22.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var username: UILabel!
    var givenEmail  = ""
    var givenUsername = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        email.text = givenEmail
        username.text = givenUsername
        // Do any additional setup after loading the view.
    }
    

    func addCutomView() {
        let myView = Bundle.main.loadNibNamed("BottomAlert", owner: nil, options: nil)![0] as? BottomAlert
        myView?.delegate = self
        myView?.frame = CGRect(x: 0, y: 700, width: 414, height: 150)
        view.addSubview(myView!)
    }

    @IBAction func signOutBtn(_ sender: Any) {
        addCutomView()
    }
}
extension DetailsVC : BottomViewDelegate {
    func dismiss(subView: UIView) {
        subView.removeFromSuperview()
    }
    
    func signOut() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    
    
}
