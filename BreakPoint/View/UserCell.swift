//
//  UserCell.swift
//  BreakPoint
//
//  Created by berkat bhatti on 1/2/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var checkImage: UIImageView!
    
    var showing = false
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            if showing == false {
            checkImage.isHidden = false
                showing = true
            }else {
                checkImage.isHidden = true
                showing = false
            }
        } else {
            return
        }
        
    }
    
    func updateCell(userimage: UIImage, email: String, isSelected: Bool) {
        self.profileImage.image = userimage
        self.emailLabel.text = email
        
        if isSelected {
            self.checkImage.isHidden = false
        } else {
            self.checkImage.isHidden = true
        }
    }

}
