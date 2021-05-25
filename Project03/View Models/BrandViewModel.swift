//
//  BrandViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 5/25/21.
//

import Foundation
import CoreData

class BrandViewModel{

    private let brand : Brand
    private let context : NSManagedObjectContext


    public init (brand : Brand){
        self.brand = brand
        context = brand.managedObjectContext!
    }

    public var name : String{
        return brand.name!
    }

    public func getProducts() throws -> [Product] {
        if let products = brand.products?.array as? [Product]{
            return products
        }
        else {throw NilError.nilErr}
    }
    enum NilError : Error{
        case nilErr
    }

}
