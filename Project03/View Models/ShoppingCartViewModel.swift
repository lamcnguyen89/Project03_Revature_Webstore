//
//  File.swift
//  Project03
//
//  Created by Kirtland Ross on 5/26/21.
//

import Foundation

class ShoppingCartViewModel{

    private let shoppingCart : ShoppingCart
    var itemNumTracker = 1

    public init (_ object : ShoppingCart){
        self.shoppingCart = object
    }

    public func getItems() throws -> [ShoppingCartItem]{
        if let items = shoppingCart.items?.array as? [ShoppingCartItem]{
            return items
        }
        else {
            throw FetchError.BadFetchRequest
        }
    }
    public func preAddItem() -> String{
        itemNumTracker+=1
        return String(itemNumTracker)
    }
    public func preSubItem() -> String{
        if itemNumTracker > 0{
            itemNumTracker-=1
        }
        return String(itemNumTracker)
    }
    public func addItemsToCart(product : Product){
        let sci = ShoppingCartItem(context: shoppingCart.managedObjectContext!)
        sci.product = product
        sci.number = Int64(itemNumTracker)
        shoppingCart.addToItems(sci)
        try! shoppingCart.managedObjectContext?.save()
        print(shoppingCart.items?.lastObject)
    }

}
