//
//  ExploreDetailsVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/31/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class ExploreDetailsVC: UIViewController {

    @IBOutlet weak var scrollviewHeight: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()

       self.tabBarController?.tabBar.isHidden = true
        
        scrollviewHeight.constant = 900
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func btnBackClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }

}
