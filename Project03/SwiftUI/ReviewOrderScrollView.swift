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
    @State var shoppingCartItems = ""
    var body: some View {
        ZStack {
 
            NavigationView {
                Form{
 
                    ForEach(1..<11){ i in
                        VStack{
                            HStack{
                                Image("3060Ti")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                Spacer()
                                VStack(alignment: .leading){
                                    Text("Item: \(i)")
                                    Spacer()
                                    Text("Price: \(i)")
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


