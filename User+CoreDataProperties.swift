//
//  User+CoreDataProperties.swift
//  
//
//  Created by Kirtland Ross on 5/25/21.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var email: String?
    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var name: String?
    @NSManaged public var password: String?
    @NSManaged public var orderHistory: OrderHistory?
    @NSManaged public var paymentOptions: PaymentOptions?
    @NSManaged public var reviews: NSSet?
    @NSManaged public var searchHistory: SearchHistory?

}

// MARK: Generated accessors for reviews
extension User {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}
