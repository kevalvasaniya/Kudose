//
//  WebService-Prefix.swift
//  SwiftDemo
//
//  Created by C79 on 18/04/16.
//  Copyright © 2016 Narolainfotech. All rights reserved.
//

import Foundation

public enum WSRequestType : Int {

    case UserLogin
    case ForgotPassword
    case GetQuestionAnswer
   
}

public enum RESPONSE_STATUS : NSInteger
{
    case VALID
    case INVALID
    case MESSAGE
}

struct WebServicePrefix
{
    static let WS_PATH = "\(Server_URL)"
    
    
    static func GetWSUrl(serviceType :WSRequestType) -> NSString
    {
        var serviceURl: NSString?
        switch serviceType
        {
            case .UserLogin:
                serviceURl = "loginUser"
                break;
            case .ForgotPassword:
                serviceURl = "forgotPassword"
                break;
            case .GetQuestionAnswer:
                serviceURl = "QuestionAnswer"
                break;
            
            
            
            }
        return "\(WS_PATH)\(serviceURl!)" as NSString
    }
}
