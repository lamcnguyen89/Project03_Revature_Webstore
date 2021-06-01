//
//  PaymentOptionsViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 6/1/21.
//

import Foundation
import CoreData
class PaymentTypeViewModel{
    private let paymentOptions : [PaymentType]
    private let context : NSManagedObjectContext
    private var selectionTracking = [String: [ObjectIdentifier]]()
    
    
    public init (payment : [PaymentType]){
        self.paymentOptions = payment
        context = payment[0].managedObjectContext!
    }
    func getAllOptions() -> [PaymentType]{
        return paymentOptions
    }
    
    func listCreditCardsTitle() -> [String]{
        var ccNums = [String]()
        for item in paymentOptions{
            if item is CreditCard{
                let cc = item as! CreditCard
                let endNums = String(cc.number).suffix(4)
                ccNums.append("Card ending with " + endNums)
                selectionTracking["CC"]?.append(item.id)
            }
        }
        return ccNums
    }
    
    func listBankAccts(){
        var bankNum = [String]()
        for item in paymentOptions{
            if item is ACH{
                let ach = item as! ACH
                let endNums = String(ach.acctNumber).suffix(4)
                bankNum.append("Account ending with " + endNums)
                selectionTracking["ACH"]?.append(item.id)
            }
        }
    }
    func getObjs() -> [PaymentType]{
        return paymentOptions
    }
    func selectPayment(type : String, id : Int) throws -> PaymentType{
       let searchingFor = selectionTracking[type]![id]
        for item in paymentOptions{
            if item.id == searchingFor{
                return item
            }
        }
        throw PaymentTypeErr.selectorNotFound
        return PaymentType()
    }

    enum PaymentTypeErr : Error {
        case selectorNotFound
    }
}
