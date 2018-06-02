//
//  HomeVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/22/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    @IBOutlet weak var tblCreatePost: UITableView!
    var fetchingMore = false
     var items = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15]
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBarController?.tabBar.isHidden = false
        
            UIApplication.shared.statusBarStyle = .lightContent
            navigationController?.isNavigationBarHidden = true
        
        let loadingNib = UINib(nibName: "LoadingCell", bundle: nil)
        tblCreatePost.register(loadingNib, forCellReuseIdentifier: "loadingCell")
        
        tblCreatePost.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnFilterPostClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idFilterPostVC) as! FilterPostVC
        self.navigationController?.pushViewController(redirectTo, animated: false)
    }
    
   
    @IBAction func btnCreatePostClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idCreatePostVC) as! CreatePostVC
        self.navigationController?.pushViewController(redirectTo, animated: false)
    }
    
    @IBAction func BtnCommentClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idCommentsVC) as! CommentsVC
        self.navigationController?.pushViewController(redirectTo, animated: false)
        
    }
    
}


extension HomeVC :UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return items.count
        } else if section == 1 && fetchingMore {
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell : NewsFeedCell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
        
        
        if indexPath.section == 0 {
            let cell : NewsFeedCell = tableView.dequeueReusableCell(withIdentifier: "NewsFeedCell") as! NewsFeedCell
            cell.lblMessage.text = "\(items[indexPath.row])"
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "loadingCell", for: indexPath) as! LoadingCell
            cell.spinner.startAnimating()
            return cell
        }
        
//
//        if(indexPath.row == 0 || indexPath.row == 3)
//        {
//             cell.lblMessage.text = "tableView.dequeueReusableCell(withIdentifier: NewsFeedCellNewsFeedCelltableView.dequeueReusableCell(withIdentifier: NewsFeedCell) as! NewsFeedCell"
//             cell.ViewMediaHeightConstrain.constant = 0
//        }else
//        {
//             cell.lblMessage.text = "tableView.dequeueReusableCell"
//             cell.ViewMediaHeightConstrain.constant = 90
//        }
//
//        cell.lblMessage.sizeToFit()

        
        
        
        //return cell
    }
    
}

extension HomeVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        
        if offsetY > contentHeight - scrollView.frame.height * 4 {
            if !fetchingMore {
                beginBatchFetch()
            }
            
        }
    }
    
    func beginBatchFetch() {
        fetchingMore = true
        print("beginBatchFetch!")
        tblCreatePost.reloadSections(IndexSet(integer: 1), with: .none)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5, execute: {
            let newItems = (self.items.count...self.items.count + 12).map { index in index }
            self.items.append(contentsOf: newItems)
            self.fetchingMore = false
            self.tblCreatePost.reloadData()
        })
    }
    
}
