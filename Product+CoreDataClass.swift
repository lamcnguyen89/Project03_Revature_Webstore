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
        let fetchReq = NSFetchRequest<Category>.init(entityName: "Category")
        if let categories = try? self.managedObjectContext?.fetch(fetchReq){
            setCategory(categories, name: dictionary["Category"]!, store: store)
        }

        let bran = Brand(context: self.managedObjectContext!)
        let rat = ProductRating(context: self.managedObjectContext!)
        featured = { () -> Bool in
            if dictionary["Featured"] == "TRUE"{
                return true
            }
            return false
        }()
        name = dictionary["Item"]
        price = Double(dictionary["Price/Unit"]!)!
        productDescription = dictionary["Description"]
        image = dictionary["Image"]

        bran.name = dictionary["Brand"]
        bran.addToProducts(self)
        rat.product = self
        self.id = Int64(dictionary["ID"]!)!
    }
    func setCategory(_ categories: [Category], name: String, store: Store){
        //find category with matching name to the parameter and set self.category to it
         if let category = categories.first(where: { category in
            category.name == name
         }){
            self.category = category
         }
         //else create new category
         else{
            let cat = Category(context: self.managedObjectContext!)
            cat.name = name
            cat.addToProducts(self)
            cat.store = store
            self.category = cat
         }
    }
}


