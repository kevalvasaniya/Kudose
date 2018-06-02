//
//  ViewController.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/22/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnSignUpClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idUserNameVC) as! UserNameVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
        
        
    }
    
    @IBAction func btnSigninClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idSigninVC) as! SignInVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }
    
    
    @IBAction func btnFacebookClicked(_ sender: UIButton) {
        
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email","public_profile"], from: self) { (result, error) in
            if (error == nil){
                print(error)
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        
                        //                        let credential = FacebookAuthProvider.credential(withAccessToken: FBSDKAccessToken.current().tokenString)
                        //                        print(FBSDKAccessToken.current().tokenString)
                        //self.firebaseLogin(credential)
                        
                        //MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                        
                        // UserDefaults.standard.set("1", forKey: "login_status")
                        
                        
                        
                        
//                        self.getFBUserData()
                        //                        fbLoginManager.logOut()
                    }
                    if(fbloginresult.isCancelled)
                    {
                        // MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                    }
                }
                else{
                    // MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
                }
                
            }
            else
            {
                //MBProgressHUD.hideAllHUDs(for: self.view, animated: true)
            }
        }
    }
    
    
}

