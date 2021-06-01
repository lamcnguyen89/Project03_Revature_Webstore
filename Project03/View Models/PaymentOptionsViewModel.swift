//
//  PaymentOptionsViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 6/1/21.
//

import Foundation
import CoreData
class PaymentOptionsViewModel{
    private let paymentOptions : [PaymentType]
    private let context : NSManagedObjectContext


    public init (payment : [PaymentType]){
        self.paymentOptions = payment
        context = payment[0].managedObjectContext!
    }
    func getAllOptions() -> [PaymentType]{
        return paymentOptions
    }

    func getCreditCardsTitle() -> [String]{
        var ccNums = [String]()
        for item in paymentOptions{
            if item is CreditCard{
                let cc = item as! CreditCard
                let endNums = String(cc.number).suffix(4)
                ccNums.append("Card ending with " + endNums)
            }
        }
        return ccNums
    }

    func getBankAccts(){
        var ccNums = [String]()
        for item in paymentOptions{
            if item is ACH{
                let ach = item as! ACH
                let endNums = String(ach.acctNumber).suffix(4)
                ccNums.append("Account ending with " + endNums)
            }
        }
    }




}
