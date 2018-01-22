//
//  groupsVC.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/21/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit

class groupsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

    }//--End view did load
    
//--Protocol function
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? groupCell else {return UITableViewCell()}
        cell.updateCell(title: "Football", descriptions: "Ravens are the best", members: 6)
        return cell
    }


}
