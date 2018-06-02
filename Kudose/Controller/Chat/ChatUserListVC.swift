//
//  ChatUserListVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class ChatUserListVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       navigationController?.isNavigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}

extension ChatUserListVC :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : ChatUserListCell = tableView.dequeueReusableCell(withIdentifier: "ChatUserListCell") as! ChatUserListCell
        
        
        
        
//        
//        if(indexPath.row == 0 || indexPath.row == 3)
//        {
//            cell.lblMessage.text = "tableView.dequeueReusableCell(withIdentifier: NewsFeedCellNewsFeedCelltableView.dequeueReusableCell(withIdentifier: NewsFeedCell) as! NewsFeedCell"
//            cell.ViewMediaHeightConstrain.constant = 0
//        }else
//        {
//            cell.lblMessage.text = "tableView.dequeueReusableCell"
//            cell.ViewMediaHeightConstrain.constant = 90
//        }
//        
//        cell.lblMessage.sizeToFit()
        //
        //        if(indexPath.row == 0)
        //        {
        //            cell.lblTitle.text = FilterPostTitle
        //            cell.lblCategory.isHidden = true
        //            cell.imgFilterPost.isHidden = true
        //            cell.imgSelectPost.isHidden = true
        //            cell.lblTitle.isHidden = false
        //
        //
        //        }else
        //        {
        //            cell.lblCategory.isHidden = false
        //            cell.imgFilterPost.isHidden = false
        //            cell.imgSelectPost.isHidden = false
        //            cell.lblTitle.isHidden = true
        //
        //            cell.imgFilterPost.image = UIImage(named: "\(imgFilterPost[indexPath.row - 1])")
        //
        //
        //            cell.lblCategory.text = "\(Category[indexPath.row - 1])"
        //            cell.lblCategory.sizeToFit()
        //        }
        
        
        
        return cell
    }
    
}

extension ChatUserListVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

