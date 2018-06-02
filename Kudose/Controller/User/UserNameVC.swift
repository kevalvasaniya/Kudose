//
//  UserNameVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/22/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class UserNameVC: UIViewController {

    @IBOutlet weak var txtName: UITextField!
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
        
//        if(txtName.text != "")
//        {
//            UserDefaultManager.setCurrentUserName(value: txtName.text!, key: "UserName")
//        }else
//        {
//            promptAlertVC(nil, stringMessage: "Please enter Name", onVC: self)
//        }
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idUserEmailVC) as! UserEmailIDVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }

}
