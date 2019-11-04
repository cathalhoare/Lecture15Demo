//
//  WaitViewController.swift
//  FirebaseDemo
//
//  Created by Cathal Hoare on 21/10/2019.
//  Copyright © 2019 Cathal Hoare. All rights reserved.
//

import UIKit

class WaitViewController: UIViewController {

    var errorCode:Int? = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginSuccess(_:)), name: Notification.Name("FirebaseDemo.signedin"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(loginFailure(_:)), name: Notification.Name("FirebaseDemo.failedsignin"), object: nil)
    }
    
    @objc func loginSuccess(_ notification:Notification){
        performSegue(withIdentifier: "movetofirstpage", sender: self)
    }
    
    @objc func loginFailure(_ notification:Notification){
        errorCode = notification.userInfo!["error"] as? Int
        performSegue(withIdentifier: "movetologinpage", sender: self)
    }

}
