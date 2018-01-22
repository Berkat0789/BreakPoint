//
//  createPostVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/28/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit
import Firebase

class createPostVC: UIViewController {
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var profileImgge: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sendButton.bindToKeyboard()
        textView.delegate = self
        
    }//--end view did load
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        email.text = Auth.auth().currentUser?.email
    }
//--Actions
    @IBAction func sendPressed(_ sender: Any) {
        guard let postMessage = textView.text, textView.text != "" || textView.text != "Say Someting here.." else {return}
        sendButton.isEnabled = false
        DataService.instance.addPosttoFirebase(withMessage: postMessage, userID: (Auth.auth().currentUser?.uid)!, groupID: nil) { (success) in
            if success {
                self.sendButton.isEnabled = true
                self.dismiss(animated: true, completion: nil)
            } else {
                self.sendButton.isEnabled = true
                print("message did not send")
            }
        }
        
        
    }
    @IBAction func closePressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    
}//end controller

extension createPostVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }
}
