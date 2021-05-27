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

    func update(name: String, image: String, price: Double, descrip: String, brand: Brand, category: Category, rating: ProductRating){

        self.name = name
        self.imageURL = image
        self.price = price
        productDescription = descrip
        self.brand = brand
        self.category = category
        self.rating = rating

    }
}

