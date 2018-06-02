 //
//  WeServicesCollector.swift
//  Heaconn
//
//  Created by C217 on 04/05/16.
//  Copyright © 2016 C81. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


class WebServicesCollection
{
    static let sharedInstance = WebServicesCollection()
    
    // METHODS
    init() {}
    
    
    func GetQuestionAnswers(ParametersDict:NSDictionary, jsonKey:NSString, responseData:@escaping (_ data:AnyObject?, _ error: NSError?, _ message: String?, _ status:Bool) -> Void)
    {
        let URL=(WebServicePrefix.GetWSUrl(serviceType: WSRequestType.GetQuestionAnswer)) as String
        HttpRequestManager.sharedInstance.postParameterRequestMultipleDataResponse(endpointurl: URL, parameters: ParametersDict, keyname: jsonKey ) {(data, error, message, responseDict, status) -> Void in
            
            print(URL)
            
            if let anError = error
            {
                responseData(nil,anError, message, status!)
            }
            else if let data = data
            {
                let thedata = data
                if(thedata != nil)
                {
                    print(thedata)
                    if (thedata.count)! > 0
                    {
                        responseData(thedata, error, message, status!)
                    }
                    else
                    {
                        responseData(thedata, error, message, status!)
                    }
                }
                else
                {
                    responseData(nil, error, message, status!)
                }
            }
            else
            {
                responseData(nil, error, message, status!)
            }
        }
    }
    
    func GetUserLogin(ParametersDict:NSDictionary, jsonKey:NSString, responseData:@escaping (_ data:AnyObject?, _ error: NSError?, _ message: String?, _ status:Bool) -> Void)
    {
        let URL=(WebServicePrefix.GetWSUrl(serviceType: WSRequestType.UserLogin)) as String
        HttpRequestManager.sharedInstance.postParameterRequestMultipleDataResponse(endpointurl: URL, parameters: ParametersDict, keyname: jsonKey ) {(data, error, message, responseDict, status) -> Void in
            
            print(URL)
            
            if let anError = error
            {
                responseData(nil,anError, message, status!)
            }
            else if let data = data
            {
                let thedata = data
                if(thedata != nil)
                {
                    print(thedata)
                    if (thedata.count)! > 0
                    {
                        responseData(thedata, error, message, status!)
                    }
                    else
                    {
                        responseData(thedata, error, message, status!)
                    }
                }
                else
                {
                    responseData(nil, error, message, status!)
                }
            }
            else
            {
                responseData(nil, error, message, status!)
            }
        }
    }
    
    func ForgotPassword(ParametersDict:NSDictionary, jsonKey:NSString, responseData:@escaping (_ data:AnyObject?, _ error: NSError?, _ message: String?, _ status:Bool) -> Void)
    {
        let URL=(WebServicePrefix.GetWSUrl(serviceType: WSRequestType.ForgotPassword)) as String
        HttpRequestManager.sharedInstance.postParameterRequestMultipleDataResponse(endpointurl: URL, parameters: ParametersDict, keyname: jsonKey ) {(data, error, message, responseDict, status) -> Void in
            
            print(URL)
            
            if let anError = error
            {
                responseData(nil,anError, message, status!)
            }
            else if let data = data
            {
                let thedata = data
                if(thedata != nil)
                {
                    print(thedata)
                    if (thedata.count)! > 0
                    {
                        responseData(thedata, error, message, status!)
                    }
                    else
                    {
                        responseData(thedata, error, message, status!)
                    }
                }
                else
                {
                    responseData(nil, error, message, status!)
                }
            }
            else
            {
                responseData(nil, error, message, status!)
            }
        }
    }
}
