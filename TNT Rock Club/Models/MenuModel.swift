//
//  MenuModel.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/21/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import Foundation
import Firebase

struct MenuModel {
    let userID: String
    let nameOfDish: String
    let typeOfDish: String
    let shortList: String
    let description: String
    let price: String
    let imageOfDish: UIImage
    let typeOfMenu: String
    let reference: DatabaseReference?
    
    init(userID: String, nameOfDish: String, typeOfDish: String, shortList: String, description: String, price: String, image: UIImage, typeOfMenu: String){
        self.userID = userID
        self.nameOfDish = nameOfDish
        self.typeOfDish = typeOfDish
        self.shortList = shortList
        self.description = description
        self.price = price
        self.imageOfDish = image
        self.typeOfMenu = typeOfMenu
        self.reference = nil
    }
    
    init(snapshot: DataSnapshot){
        let snapshotValue = snapshot.value as! [String: AnyObject]
        userID = snapshotValue["userID"] as! String
        nameOfDish = snapshotValue["nameOfDish"] as! String
        typeOfDish = snapshotValue["typeOfDish"] as! String
        shortList = snapshotValue["shortList"] as! String
        description = snapshotValue["description"] as! String
        price = snapshotValue["price"] as! String
        imageOfDish = snapshotValue["imageOfDish"] as! UIImage
        typeOfMenu = snapshotValue["typeOfMenu"] as! String
        reference = snapshot.ref
    }
}
