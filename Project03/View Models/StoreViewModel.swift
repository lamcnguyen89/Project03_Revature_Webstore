//
//  File.swift
//  Project03
//
//  Created by Kirtland Ross on 6/6/21.
//

import Foundation
import CoreData

class StoreViewModel{
    private let store : Store?
    private let context : NSManagedObjectContext?


    public init (store : Store){
        self.store = store
        context = store.managedObjectContext!
    }
    public init(){
        store = nil
        context = nil
    }
    func filterProducts(_ categoryName : String) -> [Product]{
        var prodArray = [Product]()
        if store != nil{
            for category in store!.categories?.array as! [Category]{
                switch categoryName {
                case "Featured":
                    for prod in category.products?.array as! [Product]{
                        if prod.isFeatured{
                            prodArray.append(prod)
                        }
                    }
                default:
                    if category.name == categoryName{
                        prodArray.append(contentsOf: category.products?.array as! [Product])
                    }
                }
            }
        }
        print("filtered items: ")
        print(prodArray)
        return prodArray
    }
}
