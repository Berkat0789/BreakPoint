//
//  createGroupVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 1/2/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit
import Firebase

class createGroupVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
//--outlets

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var desctiptiontextfield: UITextField!
    @IBOutlet weak var emailsearchField: UITextField!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var addpeopletoList: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
//Variables and Arrays
    var EmailArray = [String]()
    var ChosenUserArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.delegate = self
        tableView.dataSource = self
        emailsearchField.delegate = self
        emailsearchField.addTarget(self, action: #selector(textfielddidChange), for: .editingChanged)

    }//=--end view did load
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        doneButton.isHidden = true
    }
//--Selectors
    
    @objc func textfielddidChange() {
        if emailsearchField.text == "" {
            EmailArray = []
            tableView.reloadData()
        } else {
            DataService.instance.getEmails(forSearchQuery: emailsearchField.text!, completed: { (AllEmails) in
                self.EmailArray = AllEmails
                self.tableView.reloadData()
            })
        }
    }
   

//__Actions
    @IBAction func DonePRessed(_ sender: Any) {
        guard let groupTitle = titleTextField.text, titleTextField.text != "" else {return}
        guard let groupDescription = desctiptiontextfield.text, desctiptiontextfield.text != "" else {return}
        
        DataService.instance.getIDsForUsers(fromEmail: ChosenUserArray) { (UserIDS) in
            var userIDs = UserIDS
            userIDs.append((Auth.auth().currentUser?.uid)!)
            
            DataService.instance.createGroup(withTitle: groupTitle, andDescription: groupDescription, containing: userIDs, completed: { (groupCreated) in
                if groupCreated {
                    self.dismiss(animated: true, completion: nil)
                }
            })
            
        }
    }
    @IBAction func closePRessed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
//--Prootocol Function
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.emailsearchField.endEditing(true)
        return true
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EmailArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "userCell", for: indexPath) as? UserCell else {return UITableViewCell()}
        let userimage = UIImage(named: "defaultProfileImage")
        if ChosenUserArray.contains(EmailArray[indexPath.row]) {
        cell.updateCell(userimage: userimage!, email: EmailArray[indexPath.row], isSelected: true)
        } else {
            cell.updateCell(userimage: userimage!, email: EmailArray[indexPath.row], isSelected: false)

        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let selectedCell = tableView.cellForRow(at: indexPath) as? UserCell else {return}
    //--if user is not  aleary in array we need to check before adding them
        if !ChosenUserArray.contains(selectedCell.emailLabel.text!) {
            ChosenUserArray.append(selectedCell.emailLabel.text!)
            addpeopletoList.text = ChosenUserArray.joined(separator: ", ")
            doneButton.isHidden = false

        } else {
            ///-- if user is alread in array we need to remove using a filter
            
            ChosenUserArray  = ChosenUserArray.filter({$0 != selectedCell.emailLabel.text!})
            if ChosenUserArray.count >= 1 {
                addpeopletoList.text = ChosenUserArray.joined(separator: ", ")
            } else {
                addpeopletoList.text = "Add users to list"
                doneButton.isHidden = true
            }
            
        }
    }
    
    
}//--End clsee
