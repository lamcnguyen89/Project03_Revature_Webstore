//
//  ReviewOrderScrollView.swift
//  Project03
//
//  Created by Lam Nguyen on 5/29/21.
//

import SwiftUI
import UIKit
struct ReviewOrderScrollView: View {

    @State var isEditing = false
    // The shoppingCartItems variable will have a call to the database that stores the user's selected items that returns an object that can be iterated through and items in the UI can be generated.
    var shoppingCartItems = LoginViewController.currentUser.shoppingCart?.items?.array as! [ShoppingCartItem]
    var cartVM : ShoppingCartViewModel
    var items : [ShoppingCartItem]
    init(){
        cartVM = ShoppingCartViewModel(LoginViewController.currentUser.shoppingCart!)
        items = try! cartVM.getItems()
    }
    var body: some View {
        ZStack {
            NavigationView {
                Form{
                    ForEach(items, id: \.self){ i in
                        VStack{
                            HStack{
                                Image(i.product!.image!)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Spacer()
                                VStack(alignment: .leading){

                                    Text(i.product!.name!)
                                    Spacer()
                                    Text("Price: $" + String(format: "%.2f",i.product!.price * Double(i.number)))
                                    Spacer()
                                    Text("Quantity: " + String(i.number))

                                }.padding()
                                Spacer()
                                VStack{
                                    Button("Quantity +", action: {
                                        i.number += 1
                                        print(i)
                                        NotificationCenter.default.post(name: .reviewOrderDidUpdate, object: nil)

                                        // I need to add a function to update the data in the CoreData
                                    })
                                    .buttonStyle(BorderlessButtonStyle())
                                    Button("Quantity -", action: {
                                        if i.number > 0 {
                                            i.number -= 1
                                            NotificationCenter.default.post(name: .reviewOrderDidUpdate, object: nil)
                                            
                                            
                                        }
                                        // I need to add a function to update the data in the CoreData
                                    })
                                    .buttonStyle(BorderlessButtonStyle())
                                }
                            }
                        }
                    }
                }
                .navigationBarTitle("Review Order")
            }
        }
    }
    
}

//struct OrderText: View {
//
//    var body: some View{
//        Text(i.product!.name!)
//        Spacer()
//        Text(String(i.product!.price))
//        Spacer()
//        Text(String(i.product!.number))
//    }
//}

//struct ReviewOrderScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        ReviewOrderScrollView()
//    }
//}
//

