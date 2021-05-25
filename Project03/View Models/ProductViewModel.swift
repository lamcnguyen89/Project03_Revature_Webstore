//
//  ProductViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 5/25/21.
//

import Foundation
import CoreData

class ProductViewModel{

    private let product : Product
    private let context : NSManagedObjectContext


    public init (product : Product){
        self.product = product
        context = product.managedObjectContext!
    }

    public var name : String{
        return product.name!
    }

    public var price : Double{
        return product.price
    }
    public var description : String{
        return product.productDescription!
    }

    public func getBrand() throws -> Brand {
        if let brand = product.brand{
            return brand
        }
        else {throw NilError.nilErr}
    }

    public func getRating() throws -> ProductRating {
        if let rating = product.rating{
            return rating
        }
        else {throw NilError.nilErr}
    }
    enum NilError : Error{
        case nilErr
    }

}
