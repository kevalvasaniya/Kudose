//
//  SignupVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit


class SignupVC: UIViewController {

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
    

    @IBAction func btnNextClicked(_ sender: UIButton) {
        
        if(txtEmail.text != "")
        {
            if(!isValidEmail(testStr: txtEmail.text!))
            {
                promptAlertVC(nil, stringMessage: "Please enter valid email", onVC: self)
            }else
            {
                if(txtPassword.text != "")
                {
                    
                    
                }else
                {
                    promptAlertVC(nil, stringMessage: "Please enter password", onVC: self)
                }
            }
        }else
        {
            promptAlertVC(nil, stringMessage: "Please enter email", onVC: self)
        }
        
//        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idUserNameVC) as! UserNameVC
//        self.navigationController?.pushViewController(redirectTo, animated: true)
    }
    
    
    

}
