//
//  ChooseInterestVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/23/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class ChooseInterestVC: UIViewController {

    var imgFilterPost = ["Wealth","Health","Food","Adventure","HomieStuff"]
    var Category = ["Wealth","Health","Food","Adventure","HomieStuff"]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
}

extension ChooseInterestVC  :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgFilterPost.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ChooseInterestCell = tableView.dequeueReusableCell(withIdentifier: "ChooseInterestCell") as! ChooseInterestCell
        
        
            
            cell.imgFilterPost.image = UIImage(named: "\(imgFilterPost[indexPath.row])")
            
            
            cell.lblCategory.text = "\(Category[indexPath.row])"
            cell.lblCategory.sizeToFit()
        
        
        
        
        return cell
    }
    
}

extension ChooseInterestVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        
            return 150
        
    }
}
