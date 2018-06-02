//
//  UserEmailIDVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/22/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class UserEmailIDVC: UIViewController {

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
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idChooseUserNameVC) as! ChooseUserNameVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }

}
