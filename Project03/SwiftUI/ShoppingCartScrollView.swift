//
//  CategoryScrollView.swift
//  Project03
//
//  Created by Kirtland Ross on 5/25/21.
//

import SwiftUI
import CoreData
import UIKit

struct ShoppingCartScrollView: View {
    @State private var showProduct = false
    @State var goToCheckout = false
    var shoppingCartItems = [
        0 : ["name" : "Nvidia 3060Ti Eagle", "price" : "600" , "image" : "3060TiEagle"],
        1 : ["name" : "Nvidia 3070 Founders" , "price" : "800" , "image" : "3070Founders"],
        2 : ["name" : "Nvidia 3080FTW", "price" : "1200" , "image" : "3080FTW"],
        3 : ["name" : "Nvidia 6700XT" , "price" : "700" , "image" : "6700XT"]
    
    ]
    
    var body: some View {
        Form{
            ForEach(0..<shoppingCartItems.count){ i in
                Button(action: {showProduct=true}) {
                    HStack{
                        Image(shoppingCartItems[i]!["image"]!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Spacer()
                        
                        VStack(alignment: .leading){
                            Text("Item: \(shoppingCartItems[i]!["name"]!)")
                            Spacer()
                            Text("Price: \(shoppingCartItems[i]!["price"]!)")
                        }.padding()
                    }
                }
            }
            Button(action: {goToCheckout=true}) {
                HStack{
                    Spacer()
                    Text("Checkout").frame( height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }.buttonStyle(BorderlessButtonStyle())
            .sheet(isPresented: $goToCheckout, content: {
                ViewControllerAsUIView(storyboard: "Main", VC: "Checkout", prodData: nil)
            })
        }

    }
}


