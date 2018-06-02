//
//  ExploreVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/25/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class ExploreVC: UIViewController , UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var FilterPostCollectionview: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        
        navigationController?.isNavigationBarHidden = true
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width-50)/2, height: (UIScreen.main.bounds.width - 50)/2)
        layout.minimumInteritemSpacing = 15
        layout.minimumLineSpacing = 15
        
        FilterPostCollectionview.collectionViewLayout = layout
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
    
    @IBAction func btnEditPostClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idCreatePostForExploreVC) as! CreatePostForExploreVC
        self.navigationController?.pushViewController(redirectTo, animated: false)
    }
    
}

extension ExploreVC : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : FilterPostCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: "FilterPostCollectionCell", for: indexPath) as! FilterPostCollectionCell
        
        if(indexPath.row == 2)
        {
            cell.lblTitle.text = "FilterPostCollectionCell"
        }else
        {
            cell.lblTitle.text = "FilterPostCollectionCellFilterPostColl"
        }
        
        cell.lblTitle.sizeToFit()
        cell.TitleHeight.constant = cell.lblTitle.frame.size.height
        
        return cell
    }
    
    
}
extension ExploreVC : UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idExploreDetailsVC) as! ExploreDetailsVC
        self.navigationController?.pushViewController(redirectTo, animated: false)

    }
}
