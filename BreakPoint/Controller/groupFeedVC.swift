//
//  groupFeedVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 1/23/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class groupFeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
//--Outlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var groupMemberListLBL: UILabel!
    @IBOutlet weak var MessageView: UIView!
    @IBOutlet weak var messageTextField: insetTextField!
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var groupTitlelbl: UILabel!
    
//--Variables and Arays
    var group: Group?
    var messageArray = [Message]()
//Passing data Functions
    func initData(forGroup group: Group) {
        self.group = group
    }
    
//Viee Function
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        groupTitlelbl.text = group?.groupTitle
        DataService.instance.getEmails(forGroups: group!) { (Emails) in
            self.groupMemberListLBL.text = Emails.joined(separator: ", ")
        }
        
        DataService.instance._DataBaseRef_groups.observe(.value) { (groupSnap) in
            DataService.instance.getMessage(forGroup: self.group!) { (Messages) in
                self.messageArray = Messages
                self.tableView.reloadData()
                //Animate new messages from the bottm
                if self.messageArray.count > 0 {
                    self.tableView.scrollToRow(at: IndexPath(row: self.messageArray.count - 1, section: 0), at: .none, animated: true)
                }
            }
        }
     
        
    }//end view will appear
    override func viewDidLoad() {
        super.viewDidLoad()
        addTaptoDismissKeyboard()
        MessageView.bindToKeyboard()
        tableView.delegate = self
        tableView.dataSource = self

    }//-- end view did load
//--Actions
    @IBAction func sendubuttonPressed(_ sender: Any) {
        guard let message = messageTextField.text, messageTextField.text != "" else {return}
        DataService.instance.addPosttoFirebase(withMessage: message, userID: (Auth.auth().currentUser?.uid)!, groupID: group?.groupID) { (Success) in
            if Success {
                self.messageTextField.text = ""
                self.tableView.reloadData()
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//--Protocol Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupFeedCell", for: indexPath) as? groupFeedCell else {return UITableViewCell()}
        let message = messageArray[indexPath.row]
        DataService.instance.getUserName(uid: message.senderID) { (email) in
            cell.UpdateCell(profileimg: UIImage(named: "defaultProfileImage")!, content: message.messageContent, email: email)
        }
        return cell
    }
//--gestures and animations
    func addTaptoDismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard(_:)))
        tableView.addGestureRecognizer(tap)
    }
//--Selectors
    @objc func dismissKeyboard(_ recon: UITapGestureRecognizer) {
        view.endEditing(true)
    }



}
