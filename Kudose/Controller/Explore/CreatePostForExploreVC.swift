//
//  CreatePostForExploreVC.swift
//  Kudose
//
//  Created by Keval Vasaniya on 5/25/18.
//  Copyright © 2018 Keval Vasaniya. All rights reserved.
//

import UIKit

class CreatePostForExploreVC: UIViewController , UITextViewDelegate,UIImagePickerControllerDelegate,
UINavigationControllerDelegate {

    @IBOutlet weak var txtAuthor: UITextField!
    @IBOutlet weak var txtTitle: UITextField!
    @IBOutlet weak var txtviewPost: UITextView!
    let picker = UIImagePickerController()
    override func viewDidLoad() {
        super.viewDidLoad()

        picker.delegate = self
        txtviewPost.delegate = self
        self.tabBarController?.tabBar.isHidden = true
        
        txtviewPost.text = "Write Post"
        txtviewPost.textColor = UIColor.lightGray
    
    }

    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if(text == "\n") {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Write Post"
            textView.textColor = UIColor.lightGray
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnAddInterestClicked(_ sender: UIButton) {
        let redirectTo = loadVC(strStoryboardId: SB_MAIN, strVCId: idChooseInterestVC) as! ChooseInterestVC
        self.navigationController?.pushViewController(redirectTo, animated: false)
    }
    
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        navigationController?.popViewController(animated: false)
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
    
}
