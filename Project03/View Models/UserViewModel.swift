//
//  UserViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 5/24/21.
//

import Foundation
import CoreData

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
    
    public func greeting() -> String{
        return "Hello " + name
    }

    public func getReviews() throws -> [Review] {
        if let reviews = user.reviews?.array as? [Review]{
            return reviews
        }
        else {throw FetchError.BadFetchRequest}
    }
    public func getShoppingCart() -> ShoppingCart{
        if user.shoppingCart == nil{
            let sc = ShoppingCart(context: user.managedObjectContext!)
            sc.user = user
            return sc
        }
        return user.shoppingCart!
    }
    public func getOrderHistory() throws -> OrderHistory {
        if let orderHistory = user.orderHistory{
            return orderHistory
        }
        else {throw FetchError.BadFetchRequest}
    }

    public func getSearchHistory() throws -> SearchHistory{
        if let searchHistory = user.searchHistory{
            return searchHistory
        }
        else {throw FetchError.BadFetchRequest}
    }

    public func getPaymentOptions() throws -> PaymentOptions{
        if let payOptions = user.paymentOptions{
            return payOptions
        }
        else {throw FetchError.BadFetchRequest}
    }


}
