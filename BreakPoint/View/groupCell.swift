//
//  groupCell.swift
//  BreakPoint
//
//  Created by berkat bhatti on 1/22/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class groupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescriptionlbl: UILabel!
    @IBOutlet weak var memberCellcount: UILabel!
    
    
    func updateCell (title: String, descriptions: String, members: Int)  {
        self.groupTitleLbl.text = title
        self.groupDescriptionlbl.text = descriptions
        self.memberCellcount.text = "\(members) Members"
    }
}
