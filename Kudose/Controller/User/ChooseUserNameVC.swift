//
//  ChooseUserNameVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class ChooseUserNameVC: UIViewController {

    @IBOutlet weak var txtUserName: UITextField!
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
        let redirectTo = loadVC(strStoryboardId: SB_USER, strVCId: idChoosePasswordVC) as! ChoosePasswordVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }

}
