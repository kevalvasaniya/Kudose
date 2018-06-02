//
//  UserDefaultManager.swift
//  SicloApp
//
//  Created by C169 on 29/05/17.
//  Copyright © 2017 Narola. All rights reserved.
//

import UIKit

class UserDefaultManager {
    
    
        class func setCurrentDate(value: String , key: String) {
             UserDefaults.standard.set(value, forKey: key)
        }
        
        class func getCurrentDate(key: String) -> String
        {
            if(UserDefaults.standard.string(forKey: key) == nil)
            {
                return "N/A"
            }
            else
            {
                 return UserDefaults.standard.string(forKey: key)!
            } 
        }
    
    class func setCurrentDeviceID(value: String , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getCurrentDeviceID(key: String) -> String
    {
        if(UserDefaults.standard.string(forKey: key) == nil)
        {
            return "N/A"
        }
        else
        {
            return UserDefaults.standard.string(forKey: key)!
        }
    }
    
    
    class func setCurrentUserName(value: String , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getCurrentUserName(key: String) -> String
    {
        if(UserDefaults.standard.string(forKey: key) == nil)
        {
            return "N/A"
        }
        else
        {
            return UserDefaults.standard.string(forKey: key)!
        }
    }
    
    class func setCurrentUserMobile(value: String , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getCurrentUserMobile(key: String) -> String
    {
        if(UserDefaults.standard.string(forKey: key) == nil)
        {
            return "N/A"
        }
        else
        {
            return UserDefaults.standard.string(forKey: key)!
        }
    }
    
        class func getIntUserPoint(key: String) -> Int {
            return UserDefaults.standard.integer(forKey: key)
        }
    
        class func setIntUserPoint(value: Int , key: String) {
            UserDefaults.standard.set(value, forKey: key)
        }
    
    class func getIntUserLevel(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func setIntUserLevel(value: Int , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func setBooleanToNewUserDefaults(value: Bool , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getBooleanFromNewUserDefaults(key: String) -> Bool {
        return UserDefaults.standard.bool(forKey: key)
    }

    class func getIntUserID(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func setIntUserID(value: Int , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getIntTotalQuestion(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func setIntTotalQuestion(value: Int , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getIntTotalRightQuestion(key: String) -> Int {
        return UserDefaults.standard.integer(forKey: key)
    }
    
    class func setIntTotalRightQuestion(value: Int , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func setAppURL(value: String , key: String) {
        UserDefaults.standard.set(value, forKey: key)
    }
    
    class func getAppURL(key: String) -> String
    {
            return UserDefaults.standard.string(forKey: key)!
    }
    
}
