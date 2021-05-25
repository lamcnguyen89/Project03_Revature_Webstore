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

    public func getReviews() throws -> [Review] {
        if let reviews = user.reviews?.allObjects as? [Review]{
            return reviews
        }
        else {throw NilError.nilErr}
    }

    public func getOrderHistory() throws -> OrderHistory {
        if let orderHistory = user.orderHistory{
            return orderHistory
        }
        else {throw NilError.nilErr}
    }

    public func getSearchHistory() throws -> SearchHistory{
        if let searchHistory = user.searchHistory{
            return searchHistory
        }
        else {throw NilError.nilErr}
    }

    public func getPaymentOptions() throws -> PaymentOptions{
        if let payOptions = user.paymentOptions{
            return payOptions
        }
        else {throw NilError.nilErr}
    }

    enum NilError : Error{
        case nilErr
    }
}
