//
//  Product+CoreDataClass.swift
//  Project03
//
//  Created by Kirtland Ross on 5/27/21.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {

    func update(dictionary: [[String:String]]){
        for item in dictionary{
            let cat = Brand(context: self.managedObjectContext!)
            let bran = Brand(context: self.managedObjectContext!)
            let rat = ProductRating(context: self.managedObjectContext!)
            
            name = item["Item"]
            price = Double(item["Price/Unit"]!)!
            productDescription = item["Description"]

            cat.name = item["Brand"]


        }


    }
}

