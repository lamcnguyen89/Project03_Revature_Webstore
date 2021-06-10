//
//  CreditCard+CoreDataClass.swift
//  Project03
//
//  Created by Kirtland Ross on 5/24/21.
//
//

import Foundation
import CoreData

@objc(CreditCard)
public class CreditCard: PaymentType {


        func update(dict: [String: String], user : User){
            zip = Int64(Int(dict["zip"]!)!)
            city = dict["city"]
            state = dict["state"]
            street = dict["street"]
            expDate = dict["expDate"]
            nameOnCard = dict["nameOnCard"]
            number = Int64(dict["number"]!)!
            self.user = user
            user.addToPaymentOptions(self)
            try! managedObjectContext?.save()
        }

}
