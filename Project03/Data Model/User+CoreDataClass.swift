//
//  User+CoreDataClass.swift
//  Project03
//
//  Created by Kirtland Ross on 5/24/21.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {
    func update(dictionary: [String:String]){
        name = dictionary["name"]
        lastName = dictionary["lastName"]
        firstName = dictionary["firstName"]
        password = dictionary["password"]
        email = dictionary["email"]
        id = Int64(dictionary["ID"]!)!
        let ws = Wishlist(context: managedObjectContext!)
        ws.user = self
        self.wishlist = ws
        try! managedObjectContext?.save()

    }
    func reset(){
        addresses = nil
        paymentOptions = nil
        reviews = nil
        searchHistory = nil
        wishlist = nil
        shoppingCart = nil
        try! managedObjectContext?.save()
    }
}
