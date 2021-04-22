//
//  UserModel.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/21/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import Foundation
import Firebase

struct UserModel {
    
    let uid: String
    let email: String
    let name: String
    let surname: String
    let age: String
    var administratorAccess: Bool = false
    
    init(user: User, age: String, name: String, surname: String){
        self.uid = user.uid
        self.email = user.email!
        self.age = age
        self.name = name
        self.surname = surname
    }
}
