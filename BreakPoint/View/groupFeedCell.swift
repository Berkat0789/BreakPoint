//
//  groupFeedCell.swift
//  BreakPoint
//
//  Created by berkat bhatti on 1/23/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class groupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var contentLbl: UILabel!
    @IBOutlet weak var emaillbl: UILabel!
    
    
    
    func UpdateCell(profileimg: UIImage, content: String, email: String) {
        self.profileImage.image = profileimg
        self.contentLbl.text = content
        self.emaillbl.text = email
    }
    
}
