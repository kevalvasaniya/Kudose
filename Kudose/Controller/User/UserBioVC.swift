//
//  UserBioVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class UserBioVC: UIViewController , UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imgUserProfile: UIImageView!
    let picker = UIImagePickerController()
//    var imageData : NSData!
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
        imgUserProfile.isUserInteractionEnabled = true
        imgUserProfile.addGestureRecognizer(tapGestureRecognizer)
        
        
    }

    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
    {
        picker.allowsEditing = false
        picker.sourceType = .photoLibrary
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        print(info)
        imgUserProfile.image = chosenImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnBackClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func btnAddInterestsClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idFilterPostVC) as! FilterPostVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }
    
    @IBAction func btnSkipClicked(_ sender: UIButton) {
//        
//        let parameter : [String:String] = ["name":"K",
//                                        "email":"vasaniya@yahoo.com",
//                                        "user_name":"K122",
//                                        "password":"v",
//                                        "interest":"1",
//                                        "bio":"test",
//                                        "deviceType":"1",
//                                        "deviceToken":"1",
//                                        "user_media_id":"2"
//        ]
//        let img = imgUserProfile.image!
//        
//        let imageData = UIImageJPEGRepresentation(img, 0.6)!
//        
//        requestWith(endUrl: "http://192.168.64.2/Kudos/GetService.php?Service=registerUser", imageData: imageData, parameters: parameter)
        
        
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: "MainTabbarVC") as! MainTabbarVC
        self.navigationController?.pushViewController(redirectTo, animated: true)
    }
    

    
    func requestWith(endUrl: String, imageData: Data?, parameters: [String : Any], onCompletion: ((JSON?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
        
        SVProgressHUD.show()
        
        let url = "http://192.168.64.2/Kudos/GetService.php?Service=registerUser" /* your API url */
        
        let headers: HTTPHeaders = [
            /* "Authorization": "your_access_token",  in case you need authorization header */
            "Content-type": "multipart/form-data"
        ]

        Alamofire.upload(multipartFormData: { (multipartFormData) in
            for (key, value) in parameters {
                multipartFormData.append("\(value)".data(using: String.Encoding.utf8)!, withName: key as String)
            }

            if let data = imageData{
               // print(data)
                multipartFormData.append(data, withName: "user_img[]", fileName: "image.png", mimeType: "image/png")
//                multipartFormData.append(data, withName: "user_img")
            }

        }, usingThreshold: UInt64.init(), to: url, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    SVProgressHUD.dismiss()
                    print("Succesfully uploaded")
                    print(response)
                    if let err = response.error{
                        onError?(err)
                        return
                    }
                    onCompletion?(nil)
                }
            case .failure(let error):
                SVProgressHUD.dismiss()
                print("Error in upload: \(error.localizedDescription)")
                onError?(error)
            }
        }
 
    }
    
}
