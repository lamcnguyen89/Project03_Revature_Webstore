//
//  CategoryScrollView.swift
//  Project03
//
//  Created by Kirtland Ross on 5/25/21.
//

import SwiftUI
import CoreData
import UIKit

struct CartScrollView: View {
    @State private var showProduct = false
    private var dataReady = false
    var user : UserViewModel?
    var cart : ShoppingCartViewModel?
    var cartItems: [ShoppingCartItem]?
    init(user: UserViewModel?){
        self.user = user
        if user != nil{
            cart = ShoppingCartViewModel(user!.getShoppingCart())
            cartItems = try! (cart?.getItems())!
            dataReady = true
        }
    }
    
    var body: some View {
        if (dataReady){
            Form{
                ForEach(cartItems!){ i in
                    Button(action: {showProduct=true}) {
                        HStack{
                            Text(String(i.number))
                            Image(i.product!.image!)
                                .resizable()
                                .frame(width: 50, height: 50, alignment: .center)
                            Text(i.product!.name!)
                            Spacer()
                            Divider()
                            Text("$" + String(i.product!.price * Double(i.number)))

                        }
                    }
                    .sheet(isPresented: $showProduct, content: {
                        ViewControllerAsUIView(storyboard: "Main", VC: "ProductDetail", prodData: i.product!, userVM: user)
                    })
                }
                Button(action: {checkout()}) {
                    HStack{
                        Spacer()
                        Text("Checkout").frame( height: 100, alignment: .center)
                        Spacer()
                    }
                }
            }
        }
        else {
            if #available(iOS 14.0, *) {
                ProgressView()
                Text("Loading")
            } else {
                Text("Loading")
            }
        }
    }
    func checkout(){
        NotificationCenter.default.post(name: .checkout, object: nil)
    }
}


