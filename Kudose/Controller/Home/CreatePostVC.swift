//
//  CreatePostVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/24/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class CreatePostVC: UIViewController , UITextViewDelegate ,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var txtView: UITextView!
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBarController?.tabBar.isHidden = true
        
        txtView.delegate = self
        txtView.text = "Got Question?"
        txtView.textColor = UIColor.lightGray
        
        picker.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
    }
    
    @IBAction func btnAddInterestClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idChooseInterestVC) as! ChooseInterestVC
        self.navigationController?.pushViewController(redirectTo, animated: false)
    }
    
    @IBAction func btnCameraClicked(_ sender: UIButton) {
        // create an actionSheet
        let actionSheetController: UIAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // create an action
        let firstAction: UIAlertAction = UIAlertAction(title: "First Action", style: .default) { action -> Void in
            
            self.picker.allowsEditing = false
            self.picker.sourceType = .camera
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.picker, animated: true, completion: nil)
        }
        
        let secondAction: UIAlertAction = UIAlertAction(title: "Second Action", style: .default) { action -> Void in
            
            self.picker.allowsEditing = false
            self.picker.sourceType = .photoLibrary
            self.picker.mediaTypes = UIImagePickerController.availableMediaTypes(for: .photoLibrary)!
            self.present(self.picker, animated: true, completion: nil)
        }
        
        let cancelAction: UIAlertAction = UIAlertAction(title: "Cancel", style: .cancel) { action -> Void in }
        
        // add actions
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancelAction)
        
        // present an actionSheet...
        present(actionSheetController, animated: true, completion: nil)
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let chosenImage = info[UIImagePickerControllerOriginalImage] as! UIImage //2
        //        myImageView.contentMode = .scaleAspectFit //3
        //        myImageView.image = chosenImage //4
        dismiss(animated:true, completion: nil) //5
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func btnPostClicked(_ sender: UIButton) {
        let parameter : [String:Any] = ["user_id":"10",
                                        "interest":"1",
                                        "feed_text":"hello this is simple post",
                                        ]
//        let img = imgUserProfile.image!
//
//        imageData = UIImageJPEGRepresentation(img, 1)! as NSData
        
//        requestWith(endUrl: "http://ec2-18-188-55-98.us-east-2.compute.amazonaws.com/Kudos/GetService.php?Service=createNewFeed", imageData: imageData! as Data, parameters: parameter)
//        navigationController?.popViewController(animated: false)
    }
    
    func requestWith(endUrl: String, imageData: Data?, parameters: [String : Any], onCompletion: ((JSON?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
        
        SVProgressHUD.show()
        
        let url = "http://ec2-18-188-55-98.us-east-2.compute.amazonaws.com/Kudos/GetService.php?Service=createNewFeed" /* your API url */
        
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
                multipartFormData.append(data, withName: "user_img", fileName: "image.jpg", mimeType: "image/jpeg")
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
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Got Question?"
            textView.textColor = UIColor.lightGray
        }
    }
}
