//
//  feedCell.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/28/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit

class feedCell: UITableViewCell {

    @IBOutlet weak var userProfile: UIImageView!
    @IBOutlet weak var userEmail: UILabel!
    @IBOutlet weak var messageBody: UILabel!
    
    
    func updateCell(profile: UIImage, email: String, Message: String) {
        self.userProfile.image = profile
        self.userEmail.text = email
        self.messageBody.text = Message
        
    }
    
}
