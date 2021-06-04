//
//  ReviewOrderScrollView.swift
//  Project03
//
//  Created by Lam Nguyen on 5/29/21.
//

import SwiftUI

struct ReviewOrderScrollView: View {
    @State var quantity = 1
    @State var isEditing = false
    // The shoppingCartItems variable will have a call to the database that stores the user's selected items that returns an object that can be iterated through and items in the UI can be generated.
    var shoppingCartItems = [
        0 : ["name" : "Nvidia 3060Ti Eagle", "price" : "600" , "image" : "3060TiEagle"],
        1 : ["name" : "Nvidia 3070 Founders" , "price" : "800" , "image" : "3070Founders"],
        2 : ["name" : "Nvidia 3080FTW", "price" : "1200" , "image" : "3080FTW"],
        3 : ["name" : "Nvidia 6700XT" , "price" : "700" , "image" : "6700XT"]
    
    ]
    var body: some View {
        ZStack {
 
            NavigationView {
                Form{
 
                    ForEach(0..<shoppingCartItems.count){ i in
                        VStack{
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
                                    Spacer()
                                    Text("Quantity: \(quantity)")
                                }.padding()
                                Spacer()
                                VStack{
                                    Button("Quantity +", action: {
                                        quantity += 1
                                        // I need to add a function to update the data in the CoreData
                                    })
                                    .buttonStyle(BorderlessButtonStyle())
                                    Button("Quantity -", action: {
                                        if quantity > 0 {
                                            quantity -= 1
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

struct ReviewOrderScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewOrderScrollView()
    }
}


