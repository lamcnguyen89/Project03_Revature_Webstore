//
//  ACH+CoreDataClass.swift
//  Project03
//
//  Created by Kirtland Ross on 5/28/21.
//
//

import Foundation
import CoreData

@objc(ACH)
public class ACH: PaymentType {
    func update(dict: [String: String], user : User){
        acctNumber = Int64(Int(dict["acctNumber"]!)!)
        nameOnAccount = dict["nameOnAccount"]
        routingNumber = Int64(dict["routingNumber"]!)!
        self.user = user
        user.addToPaymentOptions(self)
        try! managedObjectContext?.save()
    }
}
