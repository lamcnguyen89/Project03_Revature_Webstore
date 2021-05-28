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

    func update(dictionary: [[String:String]], store: Store){
        for item in dictionary{
            let cat = Category(context: self.managedObjectContext!)
            let bran = Brand(context: self.managedObjectContext!)
            let rat = ProductRating(context: self.managedObjectContext!)

            name = item["Item"]
            price = Double(item["Price/Unit"]!)!
            productDescription = item["Description"]
            image = item["Image"]
            cat.name = item["Category"]
            cat.addToProducts(self)
            cat.store = store
            bran.name = item["Brand"]
            bran.addToProducts(self)
            rat.product = self

            do{
                try self.managedObjectContext?.save()}

            catch{
                print("Product.update save failed")
            }

        }


    }
}

