//
//  SignInVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit
import SVProgressHUD
import Alamofire
import SwiftyJSON

class SignInVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func btnNextClicked(_ sender: UIButton) {
        
//        if(txtEmail.text != "")
//        {
//            if(!isValidEmail(testStr: txtEmail.text!))
//            {
//                promptAlertVC(nil, stringMessage: "Please enter valid email", onVC: self)
//            }else
//            {
//                if(txtPassword.text != "")
//                {
//
//
//                }else
//                {
//                    promptAlertVC(nil, stringMessage: "Please enter password", onVC: self)
//                }
//            }
//        }else
//        {
//            promptAlertVC(nil, stringMessage: "Please enter email", onVC: self)
//        }
        
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: "MainTabbarVC") as! MainTabbarVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
//        callWSUserLogin()
    }
    @IBAction func btnForgotPassword(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idForgotPasswordVC) as! ForgotPasswordVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }
    
    
    //MARK:- Call WS
    func callWSUserLogin() {
        SVProgressHUD.show()
        
        let UID = UserDefaultManager.getIntUserID(key: "UserID")
        
        let logindic: NSDictionary  =  ["user_name" : "keval1231",
                                        "password":"password123",
                                        "deviceType":"0",
                                        "deviceToken":"123",
                                        "secret_key":"123",
                                        "access_key":"123",
                                        "lastLogInKey":"123"
                                        ]
        //
        WebServicesCollection.sharedInstance.GetUserLogin(ParametersDict: logindic, jsonKey: UserKey as NSString,responseData:
            { (data, err, message, status) in
                ShowNetworkIndicator(xx: false)
                print(err)
                if(err != nil)
                {
                    SVProgressHUD.dismiss()
                    return
                }
                if(status)
                {
                    
                    
                    if(data != nil)
                    {
                        

                        
//                        self.UserEarning = data as! NSArray
                        DispatchQueue.main.async {
                            SVProgressHUD.dismiss()
                            let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: "MainTabbarVC") as! MainTabbarVC
                            self.navigationController?.pushViewController(redirectTo, animated: true)
                            
                        }
                    }
                    
                }
                else
                {
                    
                    SVProgressHUD.dismiss()
                    
                    
                    
                }
        })
        
        
    }
    
    
    //MARK:- Call WS
    func callWSQuestionAnswer() {
        SVProgressHUD.show()
        
        let logindic: NSDictionary =  ["" : ""]
        
        //        btnOptionA.backgroundColor = UIColor.clear
        //        btnOptionB.backgroundColor = UIColor.clear
        //        btnOptionC.backgroundColor = UIColor.clear
        //        btnOptionD.backgroundColor = UIColor.clear
        
       
        
        WebServicesCollection.sharedInstance.GetQuestionAnswers(ParametersDict: logindic, jsonKey: UserKey as NSString,responseData:
            { (data, err, message, status) in
                ShowNetworkIndicator(xx: false)
                //print(err)
                if(err != nil)
                {
                    //                    showMessageWithRetry((err?.localizedDescription)!, 3, buttonTapHandler: { _ in
                    //                        SwiftMessages.hide()
                    //                        self.btnLoginClicked((Any).self)
                    //                    })
                    return
                }
                if(status)
                {
                    // print("data",data)
                    if(data != nil)
                    {
                        DispatchQueue.main.async {
                            SVProgressHUD.dismiss()
                            
                            
                        }
                    }
                    else
                    {
                        
                        SVProgressHUD.dismiss()
                    }
                }
                else
                {
                    
                    self.callWSQuestionAnswer()
                    SVProgressHUD.dismiss()
                    
                    
                    
                }
        })
        
    }
}
