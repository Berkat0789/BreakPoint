//
//  DataService.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/20/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import Foundation
import Firebase

let Firebase_Reference = Database.database().reference()

class DataService {
    static let instance = DataService()
    
// Arrrays and variables
    var feedMaessages = [Message]()
    
    private(set) public var _DataBaseRef = Firebase_Reference
    private(set) public var _DataBaseRef_users = Firebase_Reference.child("users")
    private(set) public var _DataBaseRef_feed = Firebase_Reference.child("feed")
    private(set) public var _DataBaseRef_groups = Firebase_Reference.child("groups")
    
    func addUsertoDatabase(uid: String, UserData: Dictionary<String, Any>) {
        _DataBaseRef_users.child(uid).updateChildValues(UserData)
    }

    func addPosttoFirebase(withMessage message: String, userID uid: String, groupID: String?, sendComplete: @escaping (_ status: Bool) -> ()) {
        if groupID != nil {
            //send to group
        } else {
            _DataBaseRef_feed.childByAutoId().updateChildValues(["content" :message, "senderID" :uid])
            sendComplete(true)
        }
  
        
    }//end add post func

    
    func getAllfeedMessages(completed: @escaping (_ message: [Message]) -> ()) {
        feedMaessages.removeAll()
        _DataBaseRef_feed.observeSingleEvent(of: .value) { (feedDataMessages) in
            guard let feedDataMessages = feedDataMessages.children.allObjects as? [DataSnapshot] else {return}
            
            for message in feedDataMessages {
                let messagebody = message.childSnapshot(forPath: "content").value as! String
                let senderID = message.childSnapshot(forPath: "senderID").value as! String
                
                let message = Message(senderID: senderID, messageContent: messagebody)
                self.feedMaessages.append(message)
                completed(self.feedMaessages)
            }
        }
        
    }//end get all messages
    
    
    func getUserName(uid: String, completed: @escaping (_ username: String) -> ()) {
        _DataBaseRef_users.observeSingleEvent(of: .value) { (UserSnapShot) in
            guard let UserSnap = UserSnapShot.children.allObjects as? [DataSnapshot] else {return}
            
            for user in UserSnap {
                if user.key == uid {
                  completed(user.childSnapshot(forPath: "email").value as! String)
                }
            }
            
        }
        
    }//end get user name
    
    
//--Get list of users based on search query..Use for over all search
    
    func getEmails(forSearchQuery query: String, completed : @escaping (_ emails: [String]) -> ()) {
        var userEmails = [String]()
        _DataBaseRef_users.observe(.value) { (userData) in
            guard let userData = userData.children.allObjects as? [DataSnapshot] else {return}
            
            for user in userData {
                let email = user.childSnapshot(forPath: "email").value as! String
                
                if email.contains(query) == true && email != Auth.auth().currentUser?.email! {
                    userEmails.append(email)
                }
            }
            completed(userEmails)
        }
    }
    


//--Dowload all ids to creade groups
    
    func getIDsForUsers(fromEmail userEmails: [String], completed: @escaping (_ IdsArray: [String]) -> ()) {
        var usersIDArray = [String]()
        _DataBaseRef_users.observeSingleEvent(of: .value) { (userSnapShot) in
            guard let userSnapShop = userSnapShot.children.allObjects as? [DataSnapshot] else {return}
            
            for user in userSnapShop {
                let email = user.childSnapshot(forPath: "email").value as! String
                if userEmails.contains(email) {
                    usersIDArray.append(user.key)
                }
            }
            completed(usersIDArray)
        }
        
    }//--end get iD
   
    func createGroup(withTitle Title: String, andDescription description: String, containing members: [String], completed: @escaping (_ GroupCreated: Bool) -> ()) {
        _DataBaseRef_groups.childByAutoId().updateChildValues(["name": Title, "description": description, "members" : members])
        completed(true)
    }
    
    
}


