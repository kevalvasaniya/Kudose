//
//  HttpRequestManager.swift
//  Copyright © 2016 PayalUmraliya. All rights reserved.

import UIKit
import Alamofire
import SwiftyJSON

class HttpRequestManager
{
    static let sharedInstance = HttpRequestManager()
    var additionalHeader = ["User-Agent": "iOS"]
    var responseObjectDic = Dictionary<String, AnyObject>()
    var URLString : String!
    var Message : String!
    var resObjects:AnyObject!
    var userPosition:AnyObject!
    var userPoint:AnyObject!
    var AppURL : String!
    var TotalEarning : String!
    var alamoFireManager = Alamofire.SessionManager.default

    init()
    {
        alamoFireManager.session.configuration.timeoutIntervalForRequest = 120 //seconds
        
    
        alamoFireManager.session.configuration.httpAdditionalHeaders = additionalHeader
    }
    
    func postParameterRequestMultipleDataResponse(endpointurl:String, parameters:NSDictionary,keyname:NSString,
                                                  responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?) -> Void)
    {
        
        //DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        
        ShowNetworkIndicator(xx: true)
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
            
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "error")
               
                if(responseString.value == nil)
                {
                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false)
                }
                else
                {
                    let strResponse = "\(responseString.value!)"
                    let arr = strResponse.components(separatedBy: "\n")
                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
                    var responseStatus = false
                    
                    if ((dict?["error"]) != nil) {
                        self.resObjects = nil
                        self.Message = dict?["error"] as! String
                    } else {
                        
                        if(dict == nil)
                        {
                            self.resObjects = nil
                            self.Message = "Fail to getting data"
                            responseStatus = false
//                            let callview = ViewController()
//                            callview.callWSQuestionAnswer()
                        }else
                        {
                            self.Message = dict?["message"] as! String
                            
                            responseStatus = dict?["success"] as! Bool
                            
                            if responseStatus {
                                self.resObjects = dict?["Data"] as AnyObject
                            } else {
                                self.resObjects = nil
                            }
                        }
                        
//                        self.Message = dict?["message"] as! String
//
//                        responseStatus = dict?["success"] as! Bool
//
//                        if responseStatus {
//                            self.resObjects = dict?["Data"] as AnyObject
//                        } else {
//                            self.resObjects = nil
//                        }
                    }
                    
                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus)
                }
            })
    }
    
//    func postParameterRequestMultipleDataResponseWithCurrentuserData(endpointurl:String, parameters:NSDictionary,keyname:NSString,
//                                                  responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?,_ userposition: AnyObject?) -> Void)
//    {
//        
//        //DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
//        
//        ShowNetworkIndicator(xx: true)
//        
//        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
//            
//            .responseString(completionHandler: { (responseString) in
//                print(responseString.value ?? "error")
//                
//                if(responseString.value == nil)
//                {
//                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false,self.userPosition)
//                }
//                else
//                {
//                    let strResponse = "\(responseString.value!)"
//                    let arr = strResponse.components(separatedBy: "\n")
//                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
//                    var responseStatus = false
//                    
//                    if ((dict?["error"]) != nil) {
//                        self.resObjects = nil
//                        self.Message = dict?["error"] as! String
//                    } else {
//                        
//                        if(dict == nil)
//                        {
//                            self.resObjects = nil
//                            self.Message = "Fail to getting data"
//                            responseStatus = false
//                            //                            let callview = ViewController()
//                            //                            callview.callWSQuestionAnswer()
//                        }else
//                        {
//                            self.Message = dict?["message"] as! String
//                            
//                            responseStatus = dict?["success"] as! Bool
//                            
//                            if responseStatus {
//                                self.resObjects = dict?["Data"] as AnyObject
//                                self.userPosition = dict?["CurrentuserData"] as AnyObject
//                                
//                            } else {
//                                self.resObjects = nil
//                                self.userPosition = nil
//                            }
//                        }
//                        
//                        //                        self.Message = dict?["message"] as! String
//                        //
//                        //                        responseStatus = dict?["success"] as! Bool
//                        //
//                        //                        if responseStatus {
//                        //                            self.resObjects = dict?["Data"] as AnyObject
//                        //                        } else {
//                        //                            self.resObjects = nil
//                        //                        }
//                    }
//                    
//                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus,self.userPosition)
//                }
//            })
//    }
//    
//    func postParameterRequestMultipleDataResponseWithUserPoint(endpointurl:String, parameters:NSDictionary,keyname:NSString,
//                                                   responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?,_ userpoint: AnyObject?,_ AppURL: String?) -> Void)
//    {
//        
//        //DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
//        
//        ShowNetworkIndicator(xx: true)
//        
//        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
//            
//            .responseString(completionHandler: { (responseString) in
//                print(responseString.value ?? "error")
//                
//                if(responseString.value == nil)
//                {
//                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false,self.userPoint,self.AppURL)
//                }
//                else
//                {
//                    let strResponse = "\(responseString.value!)"
//                    let arr = strResponse.components(separatedBy: "\n")
//                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
//                    var responseStatus = false
//                    
//                    if ((dict?["error"]) != nil) {
//                        self.resObjects = nil
//                        self.Message = dict?["error"] as! String
//                    } else {
//                        
//                        if(dict == nil)
//                        {
//                            self.resObjects = nil
//                            self.Message = "Fail to getting data"
//                            responseStatus = false
//                            //                            let callview = ViewController()
//                            //                            callview.callWSQuestionAnswer()
//                        }else
//                        {
//                            self.Message = dict?["message"] as! String
//                            self.AppURL = dict?["AppURL"] as! String
//                            
//                            responseStatus = dict?["success"] as! Bool
//                            
//                            if responseStatus {
//                                self.resObjects = dict?["Data"] as AnyObject
//                                self.userPoint = dict?["UserPoint"] as AnyObject
//                                
//                            } else {
//                                self.resObjects = nil
//                                self.userPoint = nil
//                            }
//                        }
//                        
//                        //                        self.Message = dict?["message"] as! String
//                        //
//                        //                        responseStatus = dict?["success"] as! Bool
//                        //
//                        //                        if responseStatus {
//                        //                            self.resObjects = dict?["Data"] as AnyObject
//                        //                        } else {
//                        //                            self.resObjects = nil
//                        //                        }
//                    }
//                    
//                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus,self.userPoint,self.AppURL)
//                }
//            })
//    }
//    func postParameterRequestMultipleDataResponseWithUserEarning(endpointurl:String, parameters:NSDictionary,keyname:NSString,
//                                                               responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?,_ TotalEarning: String?) -> Void)
//    {
//        
//        //DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
//        
//        ShowNetworkIndicator(xx: true)
//        
//        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
//            
//            .responseString(completionHandler: { (responseString) in
//                print(responseString.value ?? "error")
//                
//                if(responseString.value == nil)
//                {
//                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false,self.TotalEarning)
//                }
//                else
//                {
//                    let strResponse = "\(responseString.value!)"
//                    let arr = strResponse.components(separatedBy: "\n")
//                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
//                    var responseStatus = false
//                    
//                    if ((dict?["error"]) != nil) {
//                        self.resObjects = nil
//                        self.Message = dict?["error"] as! String
//                    } else {
//                        
//                        if(dict == nil)
//                        {
//                            self.resObjects = nil
//                            self.Message = "Fail to getting data"
//                            responseStatus = false
//                            //                            let callview = ViewController()
//                            //                            callview.callWSQuestionAnswer()
//                        }else
//                        {
//                            self.Message = dict?["message"] as! String
//                            self.TotalEarning = dict?["TotalEarning"] as! String
//                            
//                            responseStatus = dict?["success"] as! Bool
//                            
//                            if responseStatus {
//                                self.resObjects = dict?["Data"] as AnyObject
////                                self.userPoint = dict?["UserPoint"] as AnyObject
//                                
//                            } else {
//                                self.resObjects = nil
////                                self.userPoint = nil
//                            }
//                        }
//                        
//                        //                        self.Message = dict?["message"] as! String
//                        //
//                        //                        responseStatus = dict?["success"] as! Bool
//                        //
//                        //                        if responseStatus {
//                        //                            self.resObjects = dict?["Data"] as AnyObject
//                        //                        } else {
//                        //                            self.resObjects = nil
//                        //                        }
//                    }
//                    
//                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus,self.TotalEarning)
//                }
//            })
//    }
    /*
    func twilioVerification(endpointurl:String, parameters:NSDictionary,responseData:@escaping (_ data: NSString?, _ error: NSString?) -> Void)
    {
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        ShowNetworkIndicator(xx: true)
    
        NSLog("URL : \(endpointurl) \nParam :\( parameters) ", "URL : \(endpointurl) \nParam :\( parameters) ")
        alamoFireManager.request(endpointurl, method: .get, parameters: parameters as? Parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            ShowNetworkIndicator(xx: false)
            print("ALAMOFIRE RESPONSE : \(response)")
            NSLog("ALAMOFIRE RESPONSE : \(response)", "ALAMOFIRE RESPONSE : \(response)")
            if let _ = response.result.error
            {
               // NSLog(response.result.error as! String, response.result.error ?? "")
                responseData("false", response.result.error as! NSString!)
            }
            else
            {
                switch(response.result)
                {
                case .success(_):
                    
                    if let value = response.result.value
                    {
                        
                        if ((value as? NSDictionary) != nil)
                        {
                            self.Message = (value as! NSDictionary).value(forKey: "message") as! String!;
                            let responseStatus = (value as! NSDictionary).value(forKey: "success")  as? Bool
                            if (responseStatus)!
                            {
                                responseData("true", self.Message as NSString? )
                            }
                            else
                            {
                                responseData("false", self.Message as NSString? )
                            }
                        }
                        
                    }
                    break
                case .failure(_):
                    responseData("false", response.result.error as! NSString!)
                    break
                }
            }
        }
    }
    
    func postParameterRequestSingleDataResponse(endpointurl:String, parameters:NSDictionary,responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?) -> Void)
    {
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        ShowNetworkIndicator(xx: true)
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
            
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "error")
                if(responseString.value == nil)
                {
                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?)
                }
                else
                {
                    let strResponse = "\(responseString.value!)"
                    let arr = strResponse.components(separatedBy: "\n")
                    let dict = convertStringToDictionary(str:arr.last!)
//                    print(dict!)
                    
                    self.Message = dict?["message"] as! String
                    let responseStatus = dict?["status"] as! NSString
                    
                    switch (responseStatus.integerValue) {
                        
                    case RESPONSE_STATUS.VALID.rawValue :
                        self.resObjects = dict?["data"] as AnyObject
                        break
                        
                    case RESPONSE_STATUS.INVALID.rawValue :
                        self.resObjects = nil
                        // self.resObjects = (response.result.value as! [NSObject : AnyObject])["data"]!
                        break
                        
                    default :
                        break
                    }
                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?)
                    
                }
            })
        
        
        //            .responseJSON { (response:DataResponse<Any>) in
        //            ShowNetworkIndicator(xx: false)
        //            if let _ = response.result.error
        //            {
        //                responseData(nil, response.result.error as NSError?, nil, response.result.error as AnyObject?)
        //            }
        //            else
        //            {
        //                switch(response.result) {
        //                case .success(_):
        //                    if let data = response.result.value
        //                    {
        //                        self.Message = (data as! NSDictionary)["message"] as! String
        //                        let responseStatus = (data as! NSDictionary)["status"] as! NSString
        //                        switch (responseStatus.integerValue) {
        //
        //                        case RESPONSE_STATUS.VALID.rawValue :
        //                            self.resObjects = (data as! NSDictionary)["data"]! as AnyObject!
        //                            break
        //
        //                        case RESPONSE_STATUS.INVALID.rawValue :
        //                            self.resObjects = nil
        //                            // self.resObjects = (response.result.value as! [NSObject : AnyObject])["data"]!
        //                            break
        //
        //                        default :
        //                            break
        //                        }
        //                        responseData(self.resObjects, nil, self.Message, response.result.value as AnyObject?)
        //                    }
        //                    break
        //
        //                case .failure(_):
        //                    responseData(nil, response.result.error as NSError?, nil, response.result.value as AnyObject?)
        //                    break
        //
        //                }
        //            }
        //        }
    }
    
    func postParameterRequestForLogin(endpointurl:String, parameters:NSDictionary, keyname:NSString, responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?) -> Void)
    {
        
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        
        ShowNetworkIndicator(xx: true)
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
            
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "error")
                if(responseString.value == nil)
                {
                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false)
                }
                else
                {
                    let strResponse = "\(responseString.value!)"
                    let arr = strResponse.components(separatedBy: "\n")
                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
                    var responseStatus = false
                    
                    if ((dict?["error"]) != nil) {
                        self.resObjects = nil
                        self.Message = dict?["error"] as! String
                    } else {
                        self.Message = dict?["message"] as! String
                        responseStatus = dict?["flag"] as! Bool
                        
                        if responseStatus {
                            self.resObjects = dict?["data"] as AnyObject
                        } else {
                            self.resObjects = nil
                        }
                    }
                    
                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus)
                }
            })
    }
    
    func postParameterRequestMultipleDataResponse(endpointurl:String, parameters:NSDictionary,keyname:NSString,
        responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?) -> Void)
    {
        
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        
        ShowNetworkIndicator(xx: true)
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
        
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "error")
                if(responseString.value == nil)
                {
                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false)
                }
                else
                {
                    let strResponse = "\(responseString.value!)"
                    let arr = strResponse.components(separatedBy: "\n")
                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
                    var responseStatus = false
                    
                    if ((dict?["error"]) != nil) {
                        self.resObjects = nil
                        self.Message = dict?["error"] as! String
                    } else {
                        self.Message = dict?["message"] as! String
                        responseStatus = dict?["flag"] as! Bool
                    
                        if responseStatus {
                            if (dict?[keyname as String] != nil) {
                                self.resObjects = dict?[keyname as String] as AnyObject
                            } else {
                                self.resObjects = nil
                            }
                        } else {
                            self.resObjects = nil
                        }
                    }
                    
                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus)
                }
            })
    }
    
    func postParameterRequestMultipleDataJSONResponse(endpointurl:String, parameters:NSDictionary,keyname:NSString,
                                                  responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?) -> Void)
    {
        
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        
        ShowNetworkIndicator(xx: true)
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader)
            
            .responseJSON { (responseString:DataResponse<Any>) in
//
//        }
//
//            responseString(completionHandler: { (responseString) in
                print(responseString.result.value ?? "error")
                if(responseString.result.value == nil)
                {
//                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false)
                    responseData(nil, responseString.result.error as NSError?, responseString.result.error?.localizedDescription, responseString.result.error as AnyObject?, false)
                }
                else
                {
                    switch(responseString.result)
                    {
                    case .success(_):
                        if let data = responseString.result.value
                        {
                            let responseStatus = (data as! NSDictionary)["flag"] as! Bool
                            switch (responseStatus) {
                                
                            case true :
                                self.Message = (data as! NSDictionary)["message"] as! String
                                self.resObjects = (data as! NSDictionary)["data"]! as AnyObject!
                                break
                            case false :
                                self.Message = (data as! NSDictionary)["message"] as! String
                                self.resObjects = nil
                                break
                                
                            }
                            responseData(self.resObjects, nil, self.Message, responseString.result.value as AnyObject?, responseStatus)
                        }
                        break
                        
                    case .failure(_):
                        responseData(nil, responseString.result.error as NSError?, responseString.result.error?.localizedDescription, responseString.result.value as AnyObject?, false)
                        break
                    }
//                    let strResponse = "\(responseString.value!)"
//                    let arr = strResponse.components(separatedBy: "\n")
//                    let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
//                    var responseStatus = false
//
//                    if ((dict?["error"]) != nil) {
//                        self.resObjects = nil
//                        self.Message = dict?["error"] as! String
//                    } else {
//                        self.Message = dict?["message"] as! String
//                        responseStatus = dict?["flag"] as! Bool
//
//                        if responseStatus {
//                            if (dict?[keyname as String] != nil) {
//                                self.resObjects = dict?[keyname as String] as AnyObject
//                            } else {
//                                self.resObjects = nil
//                            }
//                        } else {
//                            self.resObjects = nil
//                        }
//                    }
//
//                    responseData(self.resObjects, nil, self.Message, responseString.value as AnyObject?, responseStatus)
                }
            }
//        )
    }
    
    func postParameterRequestForToken(endpointurl:String, parameters:NSDictionary,responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?) -> Void)
    {
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        
        ShowNetworkIndicator(xx: true)
        
        
        
        //        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader).responseString { (response) in
        //            //print("RESPONSE STRING \(response)")
        //        }
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: additionalHeader).responseJSON { (response:DataResponse<Any>) in
            ShowNetworkIndicator(xx: false)
            if let _ = response.result.error
            {
                responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription, response.result.error as AnyObject?)
            }
            else
            {
                switch(response.result)
                {
                case .success(_):
                    if let data = response.result.value
                    {
                        self.Message = (data as! NSDictionary)["message"] as! String
                        let responseStatus = (data as! NSDictionary)["status"] as! NSString
                        switch (responseStatus.integerValue) {
                            
                        case RESPONSE_STATUS.VALID.rawValue :
                            self.resObjects = (data as! NSDictionary)["TempToken"]! as AnyObject!
                            break
                        case RESPONSE_STATUS.INVALID.rawValue :
                            self.resObjects = nil
                            break
                            
                        default :
                            break
                        }
                        responseData(self.resObjects, nil, self.Message, response.result.value as AnyObject?)
                    }
                    break
                    
                case .failure(_):
                    responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription, response.result.value as AnyObject?)
                    break
                }
            }
        }
    }
    
    func postParameterRequestWithoutDataKey(endpointurl:String, parameters:NSDictionary,responseData:@escaping (_ status: Bool?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?) -> Void)
    {
        
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        
        ShowNetworkIndicator(xx: true)
        var returnStatus = false
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: nil)
            
            .responseString(completionHandler: { (responseString) in
                print(responseString.value ?? "error")
                if(responseString.value == nil)
                {
                    responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?)
                }
                else
                {
                    let strResponse = "\(responseString.value!)"
                    let arr = strResponse.components(separatedBy: "\n")
                    let dict = convertStringToDictionary(str:arr.last!)
                    print(dict!)
                    
                    self.Message = dict?["message"] as! String
                    let responseStatus = dict?["status"] as! NSString
                    
                    switch (responseStatus.integerValue) {
                        
                    case RESPONSE_STATUS.VALID.rawValue :
                        self.resObjects = dict?["data"] as AnyObject
                        returnStatus = true
                        break
                        
                    case RESPONSE_STATUS.INVALID.rawValue :
                        self.resObjects = nil
                        returnStatus = false
                        // self.resObjects = (response.result.value as! [NSObject : AnyObject])["data"]!
                        break
                        
                    default :
                        break
                    }
                    responseData(returnStatus, nil, self.Message, responseString.value as AnyObject?)
                    
                }
            })
        
        //            .responseJSON { (response:DataResponse<Any>) in
        //            ShowNetworkIndicator(xx: false)
        //            if let _ = response.result.error
        //            {
        //                responseData(nil, response.result.error as NSError?, nil, response.result.error as AnyObject?)
        //            }
        //            else
        //            {
        //                switch(response.result)
        //                {
        //                case .success(_):
        //                    if let data = response.result.value
        //                    {
        //                        self.Message = (data as! NSDictionary)["message"] as! String
        //                        let responseStatus = (data as! NSDictionary)["status"] as! NSString
        //                        switch (responseStatus.integerValue)
        //                        {
        //                        case RESPONSE_STATUS.VALID.rawValue :
        //                            returnStatus = true
        //                            break
        //
        //                        case RESPONSE_STATUS.INVALID.rawValue :
        //                            returnStatus = false
        //                            break
        //                        default :
        //                            break
        //                        }
        //                        responseData(returnStatus, nil, self.Message, response.result.value as AnyObject?)
        //                    }
        //                    break
        //
        //                case .failure(_):
        //                    responseData(false, response.result.error as NSError?, nil, response.result.value as AnyObject?)
        //                    break
        //
        //                }
        //            }
        //        }
        
    }
    
    func postJSONRequest(endpointurl:String, parameters:NSDictionary,responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?) -> Void)
    {
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        ShowNetworkIndicator(xx: true)
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            ShowNetworkIndicator(xx: false)
            if let _ = response.result.error
            {
                responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription, response.result.error as AnyObject?)
            }
            else
            {
                switch(response.result)
                {
                case .success(_):
                    if let data = response.result.value
                    {
                        self.Message = (data as! NSDictionary)["message"] as! String
                        let responseStatus = (data as! NSDictionary)["status"] as! NSString
                        switch (responseStatus.integerValue) {
                            
                        case RESPONSE_STATUS.VALID.rawValue :
                            self.resObjects = (data as! NSDictionary)["data"]! as AnyObject!
                            break
                            
                        case RESPONSE_STATUS.INVALID.rawValue :
                            self.resObjects = nil
                            break
                        default :
                            break
                        }
                        responseData(self.resObjects, nil, self.Message, response.result.value as AnyObject?)
                    }
                    break
                case .failure(_):
                    responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription, response.result.value as AnyObject?)
                    break
                }
            }
        }
    }
    
    //MARK:- GET Request1
    
    func getRequestWithoutParams(endpointurl:String,responseData:@escaping (_ data:AnyObject?, _ error: NSError?, _ message: String?) -> Void)
    {
        DLog(message: "URL : \(endpointurl)")
        ShowNetworkIndicator(xx: true)
        
        
        alamoFireManager.request(endpointurl, method: .get).responseJSON { (response:DataResponse<Any>) in
            ShowNetworkIndicator(xx: false)
            
            if let _ = response.result.error
            {
                responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription)
            }
            else
            {
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value
                    {
                        self.Message = (data as! NSDictionary)["message"] as! String
                        let responseStatus = (data as! NSDictionary)["status"] as! NSString
                        switch (responseStatus.integerValue) {
                            
                        case RESPONSE_STATUS.VALID.rawValue :
                            self.resObjects = (data as! NSDictionary)["data"]! as AnyObject!
                            break
                            
                        case RESPONSE_STATUS.INVALID.rawValue :
                            self.resObjects = nil
                            break
                            
                        default :
                            break
                        }
                        responseData(self.resObjects, nil, self.Message)
                    }
                    break
                    
                case .failure(_):
                    responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription)
                    break
                    
                }
            }
        }
    }
    
    //MARK:- GET Request
    func getRequestWithParamsAndWithDataKey(endpointurl:String, parameters:NSDictionary, keyname: String, responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?) -> Void)
    {
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        ShowNetworkIndicator(xx: true)

        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(APP_DELEGATE.objUser?.token ?? "")",
            "Accept": "application/json"
        ]
        alamoFireManager.session.configuration.httpAdditionalHeaders = headers
        
        
        
        
        alamoFireManager.request(endpointurl, headers: headers).responseString(completionHandler: { (responseString) in
            print(responseString.value ?? "error")
            if(responseString.value == nil)
            {
                responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false)
            }
            else
            {
                let strResponse = "\(responseString.value!)"
                let arr = strResponse.components(separatedBy: "\n")
                let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
                var responseStatus = false
                
                if ((dict?["error"]) != nil) {
                    self.resObjects = nil
                    self.Message = dict?["error"] as! String
                } else {
                    self.Message = dict?["message"] as! String
                    responseStatus = dict?["flag"] as! Bool
                    
                    if responseStatus {
                        if (dict?["data"] != nil) {
                            self.resObjects = dict?["data"] as AnyObject
                        } else {
                            self.resObjects = nil
                        }
                    } else {
                        self.resObjects = nil
                    }
                }
                
                responseData(self.resObjects, nil, self.Message, dict as AnyObject, responseStatus)
            }
        })
        
    }
    
    //MARK:- GET Request
    func getRequestWithParamsAndWithDataKey123(endpointurl:String, parameters:NSDictionary, keyname: String, responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?, _ status: Bool?) -> Void)
    {
        DLog(message: "URL : \(endpointurl) \nParam :\( parameters) ")
        ShowNetworkIndicator(xx: true)
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(APP_DELEGATE.objUser?.token ?? "")",
            "Accept": "application/json"
        ]
        alamoFireManager.session.configuration.httpAdditionalHeaders = headers
        
        
        
        alamoFireManager.request(endpointurl, method: .get, parameters: parameters as? Parameters, encoding: JSONEncoding.default, headers: headers).responseString(completionHandler: { (responseString) in
            print(responseString.value ?? "error")
            if(responseString.value == nil)
            {
                responseData(nil, responseString.error as NSError?, responseString.error?.localizedDescription, responseString.error as AnyObject?, false)
            }
            else
            {
                let strResponse = "\(responseString.value!)"
                let arr = strResponse.components(separatedBy: "\n")
                let dict =  convertStringToDictionary(str:(arr.last  ?? "")!)
                var responseStatus = false
                
                if ((dict?["error"]) != nil) {
                    self.resObjects = nil
                    self.Message = dict?["error"] as! String
                } else {
                    self.Message = dict?["message"] as! String
                    responseStatus = dict?["flag"] as! Bool
                    
                    if responseStatus {
                        if (dict?["data"] != nil) {
                            self.resObjects = dict?["data"] as AnyObject
                        } else {
                            self.resObjects = nil
                        }
                    } else {
                        self.resObjects = nil
                    }
                }
                
                responseData(self.resObjects, nil, self.Message, dict as AnyObject, responseStatus)
            }
        })
        
    }
    
    //MARK:- PUT Request
    func putRequest(endpointurl:String,parameters:NSDictionary,responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?) -> Void)
    {
        ShowNetworkIndicator(xx: true)
        
        alamoFireManager.request(endpointurl, method: .post, parameters: parameters as? Parameters).responseJSON { (response:DataResponse<Any>) in
            ShowNetworkIndicator(xx: false)
            if let _ = response.result.error
            {
                responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription)
            }
            else
            {
                switch(response.result) {
                case .success(_):
                    if let data = response.result.value
                    {
                        self.Message = (data as! NSDictionary)["message"] as! String
                        let responseStatus = (data as! NSDictionary)["status"] as! NSString
                        switch (responseStatus.integerValue) {
                            
                        case RESPONSE_STATUS.VALID.rawValue :
                            self.resObjects = (data as! NSDictionary)["data"]! as AnyObject!
                            break
                            
                        case RESPONSE_STATUS.INVALID.rawValue :
                            self.resObjects = nil
                            break
                            
                        default :
                            
                            break
                            
                        }
                        responseData(self.resObjects, nil, self.Message)
                    }
                    break
                    
                case .failure(_):
                    responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription)
                    break
                    
                }
            }
        }
    }

    
    //MARK:- Download
//    func download(endpointurl:String,fileName:String,responseData:@escaping (_ status:Bool?,_ filename:String,_ error:NSError?) -> Void)
//    {
//        let appURL = getDownloadVideoCacheDirectoryPath()
//        let filename = (endpointurl as NSString).lastPathComponent
//        let outputUrl = appURL?.appendingPathComponent(filename)
//        
//        alamoFireManager.download(endpointurl, method: .get, to: { (url, response) -> (destinationURL: URL, options: DownloadRequest.DownloadOptions) in
//            //return (filePathURL, [.removePreviousFile, .createIntermediateDirectories])
//            /*let pathComponent = "\(fileName).mov"
//             let fileManager = FileManager.default
//             let directoryURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
//             let fileUrl = directoryURL.appendingPathComponent(pathComponent)*/
//            //return fileUrl
//            return (outputUrl!, [.removePreviousFile, .createIntermediateDirectories])
//        })
//            .downloadProgress { progress in
//            print("Download Progress: \(progress.fractionCompleted)")
////                self.downloadDelegate?.didReceivedDownloadProgress(progress: Float(progress.fractionCompleted),filename: filename)
//                
//            }
//            .responseData { (response) in
//                switch response.result
//                {
//                case .success( _):
//                    responseData(true,filename, nil)
//                //got video data here
//                case .failure(let error):
//                   // self.downloadDelegate?.didFailedDownload(filename: filename)
//                    responseData(false,filename,error as NSError?)
//                }
//                
//        }
//    }
    
    //MARK:- Multipart
    func uploadImagePost(endpointurl:String, isForeground:Bool,parameters:NSDictionary, mediaData: Data,responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?) -> Void)
    {
        //  var isUploading : Bool = true
        alamoFireManager.upload(
            multipartFormData: { multipartFormData in
                multipartFormData.append(mediaData, withName: "stories", fileName: "mystory.jpg", mimeType: "image/jpeg")
                
                for (key, value) in parameters {
                    let valueData:Data = (value as! NSString).data(using: String.Encoding.utf8.rawValue)!
                    multipartFormData.append(valueData, withName: key as! String)
                }
        },
            to: endpointurl,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString(completionHandler:
                        { 
                            
                            (string) in
                            if("\(string.result)" != "failure")
                            {
                                if(string.value != nil)
                                {
                                    let strResponse = "\(string.value!)"
                                    let arr = strResponse.components(separatedBy: "\n")
                                    let dict = convertStringToDictionary(str:arr.last!)
                                    self.Message = dict?["message"] as? String ?? "0"
                                    let responseStatus = dict?["status"] as! NSString
                                    
                                    switch (responseStatus.integerValue) {
                                        
                                    case RESPONSE_STATUS.VALID.rawValue :
                                        self.resObjects = dict?["stories" as String] as AnyObject
                                        break
                                        
                                    case RESPONSE_STATUS.INVALID.rawValue :
                                        self.resObjects = nil
                                        break
                                        
                                    default :
                                        break
                                        
                                    }
                                     responseData(self.resObjects, nil, self.Message,"\(responseStatus)" as AnyObject?)
                                }
                                else
                                {
                                    responseData(nil, nil, "", nil)
                                }
                            }
                            else
                            {
                                responseData(nil, nil, "", nil)
                            }
                    })                      
                    break
                case .failure(let encodingError):
                    print("ENCODING ERROR: ",encodingError)
                    responseData(nil, nil, "", nil)
                }
        }
        )
    }

    func uploadVideoPost(endpointurl:String, isForeground:Bool,parameters:NSDictionary, videoData: Data,responseData:@escaping (_ data: AnyObject?, _ error: NSError?, _ message: String?, _ responseDict: AnyObject?) -> Void)  {
        
        var isUploading : Bool = true
        
        alamoFireManager.upload(
            multipartFormData: { multipartFormData in
                //multipartFormData.append(thumbData, withName: "media_image", fileName: "swift_file.jpg", mimeType: "image/jpeg")
                multipartFormData.append(videoData, withName: "stories", fileName: "mystory.mp4", mimeType: "video/mp4")
                
                for (key, value) in parameters {
                    
                    //print("Key \(key)  ----- Value \(value)")
                    let valueData:Data = (value as! NSString).data(using: String.Encoding.utf8.rawValue)!
                    multipartFormData.append(valueData, withName: key as! String)
                }
        },
            to: endpointurl,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.uploadProgress(closure: { (progress) in
                        if isUploading && isForeground {
                        //    self.delegate?.didReceivedProgress(progress: Float(progress.fractionCompleted))
                        }
                    })
                    
                    
                    upload.responseString(completionHandler: { (string) in
                        //print("Response string  : \(string)")
                    })
                    
                    upload.responseJSON { response in
                        //print(response)
                        switch(response.result) {
                        case .success(_):
                            upload.responseString(completionHandler:
                                { 
                                    
                                    (string) in
                                    if("\(string.result)" != "failure")
                                    {
                                        let strResponse = "\(string.value!)"
                                        let arr = strResponse.components(separatedBy: "\n")
                                        let dict = convertStringToDictionary(str:arr.last!)
                                        self.Message = dict?["message"] as? String ?? "0"
                                        let responseStatus = dict?["status"] as! NSString
                                        
                                        switch (responseStatus.integerValue) {
                                            
                                        case RESPONSE_STATUS.VALID.rawValue :
                                            self.resObjects = dict?["stories" as String] as AnyObject
                                            break
                                            
                                        case RESPONSE_STATUS.INVALID.rawValue :
                                            self.resObjects = nil
                                            break
                                            
                                        default :
                                            break
                                            
                                        }
                                        responseData(self.resObjects, nil, self.Message,"\(responseStatus)" as AnyObject?)
                                    }
                                    else
                                    {
                                        responseData(nil, nil, response.result.error?.localizedDescription, nil)
                                    }
                            })  
                            break
                            
                        case .failure(_):
                            responseData(nil, response.result.error as NSError?, response.result.error?.localizedDescription, response.result.value as AnyObject?)
                            break
                            
                        }
                    }
                case .failure( _):
                    //print(encodingError)
                    isUploading =  false
                    responseData(nil, nil, "", nil)
                }
        }
        )
        
    }

//    func cancelAllAlamofireRequests(responseData:@escaping ( _ status: Bool?) -> Void)
//    {
//       alamoFireManager.session.getTasksWithCompletionHandler
//            {
//                dataTasks, uploadTasks, downloadTasks in
//                dataTasks.forEach { $0.cancel() }
//                uploadTasks.forEach { $0.cancel() }
//                downloadTasks.forEach { $0.cancel() }
//                responseData(true)
//        }
//    }
    */
}
