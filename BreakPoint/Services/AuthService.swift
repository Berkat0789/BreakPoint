//
//  AuthService.swift
//  BreakPoint
//
//  Created by berkat bhatti on 12/20/17.
//  Copyright © 2017 TKM. All rights reserved.
//

import Foundation
import Firebase


class AuthService {
    static let instance = AuthService()
    
    
    func RegisterUser(email: String, Password: String, registerCompleted: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().createUser(withEmail: email, password: Password) { (user, error) in
            guard let user = user else {
                registerCompleted(false, error)
                return
            }
            let UserData = ["provider" : user.providerID, "email" : user.email]
            DataService.instance.addUsertoDatabase(uid: user.uid, UserData: UserData)
            registerCompleted(true, nil)
        }
    }
    
    func LoginUser(email: String, Password: String, loginCompleted: @escaping (_ status: Bool, _ error: Error?) -> ()) {
        Auth.auth().signIn(withEmail: email, password: Password) { (user, error) in
            guard let user = user else {
                loginCompleted(false, error)
                return
            }
            loginCompleted(true, nil)
        }
    }

}//end class
