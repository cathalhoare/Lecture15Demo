//
//  AppDelegate.swift
//  FirebaseDemo
//
//  Created by Cathal Hoare on 18/10/2019.
//  Copyright © 2019 Cathal Hoare. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class User{
    
    func signin(with username:String, password:String){
        
        Auth.auth().signIn(withEmail: username, password:password){
            [weak self] authResult, error in
               
            if(authResult != nil){
                
            NotificationCenter.default.post(name:Notification.Name("FirebaseDemo.signedin"), object:nil, userInfo:nil)
            }
            else{
                
                let errCode = ["error":error!._code]
                   
            NotificationCenter.default.post(name:Notification.Name("FirebaseDemo.failedsignin"), object:nil, userInfo:errCode)
            }
        }
    }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var user:User = User()
   
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        FirebaseApp.configure()
      
        return true
    }

    // MARK: UISceneSession Lifecycle

    @available(iOS 13.0, *)
    @available(iOS 13.0, *)
    @available(iOS 13.0, *)
    @available(iOS 13.0, *)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        
            return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
        
    }

    @available(iOS 13.0, *)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

