//
//  BottomAlert.swift
//  Task_14_elizbar
//
//  Created by alta on 7/9/22.
//

import UIKit

protocol BottomViewDelegate {
    func signOut()
    func dismiss(subView : UIView)
}
class BottomAlert: UIView {
    var delegate: BottomViewDelegate!
    
    

    @IBOutlet weak var caution: UILabel!

    @IBAction func selfDismiss(_ sender: Any) {
        delegate.dismiss(subView: self)
        
    }
    @IBAction func signOut(_ sender: Any) {
        delegate.signOut()
    }
}
