//
//  insetTextField.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/20/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import UIKit
@IBDesignable

class insetTextField: UITextField {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        updateView()
    }
    let padding = UIEdgeInsets(top: 0, left: 29, bottom: 0, right: 0)
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)
    }
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)

    }
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return UIEdgeInsetsInsetRect(bounds, padding)

    }
    
    func updateView() {
        let placeholder = NSAttributedString(string: self.placeholder!, attributes: [NSAttributedStringKey.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
        self.attributedPlaceholder = placeholder
        self.layer.borderColor = #colorLiteral(red: 0.662745098, green: 0.662745098, blue: 0.662745098, alpha: 1)
        self.layer.borderWidth = 1.0
    }
   
    
}//end class
