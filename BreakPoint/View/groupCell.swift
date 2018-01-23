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
    
    
    func updateCell (group: Group)  {
        self.groupTitleLbl.text = group.groupTitle
        self.groupDescriptionlbl.text = group.groupDescription
        self.memberCellcount.text = "\(group.groupMemberCount!) Members"
    }
}
