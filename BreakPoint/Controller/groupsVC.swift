//
//  groupsVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/21/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit

class groupsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
//--Outlets
    @IBOutlet weak var tableView: UITableView!
//--var arrays and
    var GroupList = [Group]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        DataService.instance.getAllGroups { (Groups) in
             self.GroupList = Groups
            self.tableView.reloadData()
        }

    }//--End view did load
    
//--Protocol function
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return GroupList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? groupCell else {return UITableViewCell()}
        let group = GroupList[indexPath.row]
        cell.updateCell(group: group)
        return cell
    }


}
