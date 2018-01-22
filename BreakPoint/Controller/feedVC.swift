//
//  feedVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/21/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit

class feedVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

//Outlets
    @IBOutlet weak var tableView: UITableView!

//--Variables and Outlets
    
    var Meassages = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }//end view did lqoad
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    
        DataService.instance.getAllfeedMessages { (MessageArray) in
            self.Meassages = MessageArray.reversed()
            self.tableView.reloadData()
        }
       
    }//--end view did appear
    
    
//--Actions
    
    
//---Protocol Functions
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Meassages.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "feedCell") as? feedCell else { return UITableViewCell() }
        let image = UIImage(named: "defaultProfileImage")
            let message = Meassages[indexPath.row]
        
        DataService.instance.getUserName(uid: message.senderID) { (returnedUserName) in
          cell.updateCell(profile: image! , email: returnedUserName, Message: message.messageContent)
        }
        return cell
        }
    

}
