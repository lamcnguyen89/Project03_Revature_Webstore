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

    func update(dictionary: [String:String], store: Store){

        let cat = Category(context: self.managedObjectContext!)
        let bran = Brand(context: self.managedObjectContext!)
        let rat = ProductRating(context: self.managedObjectContext!)

        name = dictionary["Item"]
        price = Double(dictionary["Price/Unit"]!)!
        productDescription = dictionary["Description"]
        image = dictionary["Image"]
        cat.name = dictionary["Category"]
        cat.addToProducts(self)
        cat.store = store
        bran.name = dictionary["Brand"]
        bran.addToProducts(self)
        rat.product = self

        

    }


}


