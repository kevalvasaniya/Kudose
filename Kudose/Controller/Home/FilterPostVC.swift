//
//  FilterPostVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/23/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class FilterPostVC: UIViewController {

    var imgFilterPost = ["Wealth","Health","Food","Adventure","HomieStuff"]
    var Category = ["Wealth","Health","Food","Adventure","HomieStuff"]
    var selectedCategory = [Int]()
    
    @IBOutlet weak var tblFilterPost: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.tabBarController?.tabBar.isHidden = true
        tblFilterPost.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
    
    @IBAction func btnDoneClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    

}

extension FilterPostVC :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return imgFilterPost.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell : FilterPostCell = tableView.dequeueReusableCell(withIdentifier: "FilterPostCell") as! FilterPostCell
        
        
        if(indexPath.row == 0)
        {
            cell.lblTitle.text = FilterPostTitle
            cell.lblCategory.isHidden = true
            cell.imgFilterPost.isHidden = true
            cell.imgSelectPost.isHidden = true
            cell.lblTitle.isHidden = false
            
            
        }else
        {
            if(selectedCategory.count == 0)
            {
                cell.imgSelectPost.isHidden = true
            }
            
            for i in 0..<selectedCategory.count
            {
                if(selectedCategory[i] == indexPath.row)
                {
                    cell.imgSelectPost.isHidden = false
                    break
                }else
                {
                    cell.imgSelectPost.isHidden = true
                }
            }
            
            cell.lblCategory.isHidden = false
            cell.imgFilterPost.isHidden = false
            //cell.imgSelectPost.isHidden = false
            cell.lblTitle.isHidden = true
            
            cell.imgFilterPost.image = UIImage(named: "\(imgFilterPost[indexPath.row - 1])")
            
            
            cell.lblCategory.text = "\(Category[indexPath.row - 1])"
            cell.lblCategory.sizeToFit()
        }
        
        
        
        return cell
    }
    
}

extension FilterPostVC : UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell : FilterPostCell = tableView.cellForRow(at: indexPath as IndexPath) as! FilterPostCell
        var isRemove = false
//        if(selectedCategory.count == 0)
//        {
//            selectedCategory.append(indexPath.row)
////            print(selectedCategory)
//        }
//        else
//        {
//            print(selectedCategory)
            for i in 0..<selectedCategory.count
            {
                let CurrentIndex = selectedCategory[i]
                if(CurrentIndex == indexPath.row)
                {
                    selectedCategory.remove(at: i)
                    isRemove = true
                    break
                    
                }
            }
//        }
        if(!isRemove)
        {
            isRemove = false
            selectedCategory.append(indexPath.row)
        }
         print(selectedCategory)
        if(cell.imgSelectPost.isHidden == true)
        {
                cell.imgSelectPost.isHidden = false
        }else
        {
            cell.imgSelectPost.isHidden = true
        }
        
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if(indexPath.row == 0)
        {
            return 60
        }else
        {
            return 150
        }
        
    }
}
