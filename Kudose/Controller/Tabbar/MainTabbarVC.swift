//
//  MainTabbarVC.swift
//  iCoinsiOS
//
//  Created by Ajay Gabani on 1/11/18.
//  Copyright © 2018 Ark Inc. All rights reserved.
//

import UIKit

class MainTabbarVC: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        [self.viewControllers objectAtIndex:0].tabBarItem.image = [[UIImage imageNamed:@"car_gray"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [self.viewControllers objectAtIndex:0].tabBarItem.selectedImage = [[UIImage imageNamed:@"car_white"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
//        [self.viewControllers objectAtIndex:0].tabBarItem.tag = 0;
        
        let imageInsets = UIEdgeInsets(top: 2, left: 0, bottom: -2, right: 0)
        
        let tabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        tabBarItem1.image = UIImage(named: "Home_unselected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem1.imageInsets = imageInsets
        
        let tabBarItem2 = (self.tabBar.items?[1])! as UITabBarItem
        tabBarItem2.image = UIImage(named: "Search_unselected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem2.imageInsets = imageInsets
        
        let tabBarItem3 = (self.tabBar.items?[2])! as UITabBarItem
        tabBarItem3.image = UIImage(named: "Hand_unselected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem3.imageInsets = imageInsets
        
        let tabBarItem4 = (self.tabBar.items?[3])! as UITabBarItem
        tabBarItem4.image = UIImage(named: "Chat_unselected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem4.imageInsets = imageInsets
        
        let tabBarItem5 = (self.tabBar.items?[4])! as UITabBarItem
        tabBarItem5.image = UIImage(named: "User_unselected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem5.imageInsets = imageInsets
        
        tabBarItem1.selectedImage = UIImage(named: "Home_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem2.selectedImage = UIImage(named: "Search_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem3.selectedImage = UIImage(named: "Hand_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem4.selectedImage = UIImage(named: "Chat_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        tabBarItem5.selectedImage = UIImage(named: "User_selected")?.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.navigationBar.isHidden = true
        //self.tabBar.tintColor = COLOR_APP_THEME()
        //self.tabBar.barTintColor = COLOR_BACKGROUND_VIEW()
        //self.tabBar.isTranslucent = false
    }
}
