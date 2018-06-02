//
//  ForgotPasswordVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit
import SVProgressHUD

class ForgotPasswordVC: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
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
//                
//            }
//        }else
//        {
//            promptAlertVC(nil, stringMessage: "Please enter email", onVC: self)
//        }
    }
    
    
    
    //MARK:- Call WS
    func callWSForgotPassword() {
        SVProgressHUD.show()
        
        let UID = UserDefaultManager.getIntUserID(key: "UserID")
        
        let logindic: NSDictionary  =  ["email" : UID,
                                        "secret_key":"password",
                                        "access_key":"password",
                                        "lastLogInKey":"password",
                                        ]
        //
        WebServicesCollection.sharedInstance.ForgotPassword(ParametersDict: logindic, jsonKey: DataKey as NSString,responseData:
            { (data, err, message, status) in
                ShowNetworkIndicator(xx: false)
                //print(err)
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
                            
                        }
                    }
                    
                }
                else
                {
                    
                    SVProgressHUD.dismiss()
                    
                    
                    
                }
        })
        
        
    }

}
