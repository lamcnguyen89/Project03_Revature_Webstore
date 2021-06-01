//
//  File.swift
//  Project03
//
//  Created by Kirtland Ross on 5/26/21.
//

import Foundation

class ShoppingCartViewModel{

    private let shoppingCart : ShoppingCart

    public init (_ object : ShoppingCart){
        self.shoppingCart = object

    }

    func getItems() throws -> [ShoppingCartItem]{
        if let items = shoppingCart.items?.array as? [ShoppingCartItem]{
            return items
        }
        else {
            throw FetchError.BadFetchRequest
        }
    }


}
