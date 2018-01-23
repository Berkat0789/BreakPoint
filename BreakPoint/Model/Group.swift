//
//  Group.swift
//  BreakPoint
//
//  Created by berkat bhatti on 1/22/18.
//  Copyright © 2018 TKM. All rights reserved.
//

import Foundation

class Group  {
    
    private(set) public var groupTitle: String!
    private(set) public var groupDescription: String!
    private(set) public var groupID: String!
    private(set) public var groupMemberCount: Int!
    private(set) public var groupMembers: [String]!

    init(Title: String, description: String, ID: String, memberCount: Int, members: [String]) {
        self.groupTitle = Title
        self.groupDescription = description
        self.groupID = ID
        self.groupMemberCount = memberCount
        self.groupMembers = members
    }
    
}
