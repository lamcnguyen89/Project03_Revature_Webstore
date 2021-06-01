//
//  AddressViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 6/1/21.
//

import Foundation
import CoreData
class AddressViewModel{
    private let address : Address
    private let context : NSManagedObjectContext

    init (address : Address){
        self.address = address
        context = address.managedObjectContext!
    }

    func listAddress() -> String{
        return String("Address with street: " + address.street!)
    }
    func getObjs() -> Address{
        return address
    }
}

