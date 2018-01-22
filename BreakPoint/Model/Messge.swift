//
//  Messge.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/30/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import Foundation

class Message {
    
    private var _senderID: String!
    private var _messageContent: String!
    
    var senderID: String {
        return _senderID
    }
    var messageContent: String {
        return _messageContent
    }

    init(senderID: String, messageContent: String) {
        self._messageContent = messageContent
        self._senderID = senderID
    }
}
