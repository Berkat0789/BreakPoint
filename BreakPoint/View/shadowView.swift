//
//  shadowView.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/20/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit

class shadowView: UIView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
    
    func updateView() {
        self.layer.shadowRadius = 4
        self.layer.shadowColor = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.layer.shadowOpacity = 0.75
    }

    

}
