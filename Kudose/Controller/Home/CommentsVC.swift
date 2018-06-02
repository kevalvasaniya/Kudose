//
//  CommentsVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/27/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class CommentsVC: UIViewController {

    @IBOutlet weak var lblPost: UILabel!
    @IBOutlet weak var PostViewHeight: NSLayoutConstraint!
    @IBOutlet weak var tblCommentList: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = true
        
        lblPost.text = "In a storyboard-based applicationIn a storyboard-based applicationIn a storyboard-based application"
        lblPost.sizeToFit()
        
        PostViewHeight.constant = 60 + lblPost.frame.size.height
        
        tblCommentList.reloadData()
        
        
    }

    @IBAction func btnBackClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


}
extension CommentsVC :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : CommentsCell = tableView.dequeueReusableCell(withIdentifier: "CommentsCell") as! CommentsCell
        
        
       
        if(indexPath.row == 0)
        {
            cell.lblComment.text = "CommentsCellCommentsCell"
//            cell.lblComment.sizeToFit()
//
//            cell.commentViewHeight.constant =  28 + cell.lblComment.frame.size.height
        }else
        {
            cell.lblComment.text = "tableView: UITableView, cellForRowAt indexPath: IndexPath)tableView: UITableView, cellForRowAt indexPath: IndexPath)"
//            cell.lblComment.sizeToFit()
//            
//            cell.commentViewHeight.constant = 28 + cell.lblComment.frame.size.height
        }
        cell.lblComment.sizeToFit()
        
        cell.commentViewHeight.constant = 40 + cell.lblComment.frame.size.height
        
        
        
        return cell
    }
    
}

extension CommentsVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        
    }
    
    
}

