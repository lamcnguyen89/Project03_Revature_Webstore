//
//  Address+CoreDataClass.swift
//  Project03
//
//  Created by Kirtland Ross on 6/1/21.
//
//

import Foundation
import CoreData

@objc(Address)
public class Address: NSManagedObject {
    func update(dict: [String: String], user : User){
        zip = Int64(Int(dict["zip"]!)!)
        city = dict["city"]
        state = dict["state"]
        street = dict["street"]
        self.user = user
        try! managedObjectContext?.save()
    }

}
