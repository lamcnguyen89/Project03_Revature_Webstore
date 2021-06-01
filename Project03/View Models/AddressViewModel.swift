//
//  AddressViewModel.swift
//  Project03
//
//  Created by Kirtland Ross on 6/1/21.
//

import Foundation
import CoreData
class AddressViewModel{
    private let addresses : [Address]
    private let context : NSManagedObjectContext

    init (addresses : [Address]){
        self.addresses = addresses
        context = addresses[0].managedObjectContext!
    }

    func    listAddresses() -> [String]{
        var addArr = [String]()
        for item in addresses{
            addArr.append(item.street!)
        }
        return addArr
    }
}
