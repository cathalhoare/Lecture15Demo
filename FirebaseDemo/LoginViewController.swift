//
//  LoginViewController.swift
//  FirebaseDemo
//
//  Created by Cathal Hoare on 21/10/2019.
//  Copyright © 2019 Cathal Hoare. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    var errorCode:Int = -1;
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "doingLoginSegue"{
            errorLabel.text = ""
            errorLabel.isHidden = true
            delegate.user.signin(with: username.text!, password: password.text!)
        }
        else{
            
        }
    }
    
    @IBAction func unwindSegue(segue:UIStoryboardSegue){
        
        let origin = segue.source as! WaitViewController
        errorCode = origin.errorCode!
        
        if(errorCode != -1){
            let dictionary = NSDictionary(contentsOfFile: Bundle.main.path(forResource:"errors", ofType:"plist")!)
            let errorDictionary = dictionary?["errors"] as! Dictionary<String, Any>
            let errorText = errorDictionary[String(errorCode)]
            
            errorLabel.text = errorText as? String
            errorLabel.isHidden = false
        }
    }
}
