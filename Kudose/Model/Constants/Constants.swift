//
//  Constants.swift
//  QuizApp
//
//  Created by keval vasaniya on 06/03/18.
//  Copyright © 2018 keval vasaniya. All rights reserved.
//

import Foundation
import UIKit

let Server_URL = "http://192.168.64.2/Kudos/GetService.php?Service="
public let UserKey = "User"
public let DataKey = "data"
//public let SB_MAIN :String = "Main"
let APP_DELEGATE = UIApplication.shared.delegate as! AppDelegate
var isInternetAvailable = false
var isNavigatefromQuestionAnswerScreen = false
public func ShowNetworkIndicator(xx :Bool)
{
    
    UIApplication.shared.isNetworkActivityIndicatorVisible = xx
}
public func COLOR_NAVIGATION_BAR() -> UIColor {
    
        return  UIColor(red: 236.0/255.0, green: 11.0/255.0, blue: 91.0/255.0, alpha: 1)
    
}

public func convertStringToDictionary(str:String) -> [String: Any]? {
    if let data = str.data(using: .utf8) {
        do {
            return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
        } catch {
            print(error.localizedDescription)
        }
    }
    return nil
}

public func loadVC(strStoryboardId: String, strVCId: String) -> UIViewController {
    
    let vc = getStoryboard(storyboardName: strStoryboardId).instantiateViewController(withIdentifier: strVCId)
    return vc
}

public func getStoryboard(storyboardName: String) -> UIStoryboard {
    return UIStoryboard(name: storyboardName, bundle: nil)
}

public func promptAlertVC(_ stringTitle: String?, stringMessage: String?, onVC VCname: UIViewController?) {
    let alert = UIAlertController(title: stringTitle, message: stringMessage, preferredStyle: .alert)
    let okAction = UIAlertAction(title: "Dismiss", style: .default, handler: {(_ action: UIAlertAction?) -> Void in
    })
    alert.addAction(okAction)
    VCname?.present(alert, animated: true) {() -> Void in }
}

func isValidEmail(testStr:String) -> Bool {
    // print("validate calendar: \(testStr)")
    let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
    
    let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
    return emailTest.evaluate(with: testStr)
}

let FilterPostTitle = "Choose which categories of tagged post you whould liketo see best on your home feed... "
