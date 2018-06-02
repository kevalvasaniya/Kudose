//
//  ChoosePasswordVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 6/1/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class ChoosePasswordVC: UIViewController {

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
        
        //        if(txtUserName.text != "")
        //        {
        //
        //        }else
        //        {
        //            promptAlertVC(nil, stringMessage: "Please enter UserName", onVC: self)
        //        }
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idUserBioVC) as! UserBioVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }
   

}
