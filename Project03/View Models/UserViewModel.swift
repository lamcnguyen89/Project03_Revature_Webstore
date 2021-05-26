//
//  UserViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 5/24/21.
//

import Foundation
import CoreData
import UIKit

class UserViewModel{
    private let user : User
    private let context : NSManagedObjectContext


    public init (user : User){
        self.user = user
        context = user.managedObjectContext!
    }

    public var name : String{
        return user.name!
    }
    public var password : String{
        return user.password!
    }
    public var lastName : String{
        return user.lastName!
    }
    public var firstName : String{
        return user.firstName!
    }
    public var email : String{
        return user.email!
    }
    public var orderHistory : OrderHistory?{
        return user.orderHistory
    }
    public var paymentOptions : PaymentOptions?{
        return user.paymentOptions
    }
    public func reviewsthrows() throws -> [Review]? {
        var reviews : [Review]?
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Review")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        fetchReq.fetchLimit = 1
        do{
            let req = try context.fetch(fetchReq) as! [Review]
            reviews = req
        }
        catch{
            throw NilError.nilErr
        }
        return reviews
    }


    enum NilError : Error{
        case nilErr
    }
}
