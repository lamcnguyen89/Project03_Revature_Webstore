//
//  ReviewOrderScrollView.swift
//  Project03
//
//  Created by Lam Nguyen on 5/29/21.
//

import SwiftUI

struct ReviewOrderScrollView: View {
    @State var showProduct = false
    var body: some View {
        
        ZStack {
 
            NavigationView {
                Form{
 
                    ForEach(0..<10){ i in
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
                                    Text("Quantity: \(i)")
                                }.padding()
                                Spacer()
                                Button("Edit", action: {removeItem()})
                    

                            }
                        }
                    }
                }
                .navigationBarTitle("Review Order")
            }
        }
    }
    
    func removeItem() {
        print("Your Item has been removed")
    }
     
    func getUserOrders() {
        
        print("midnight moonlight")
        // Use the function to pull all the items that a user has stored in the Entity that contains all the items that a user has added to his/her cart.
        // I'm going to have to study the Class Diagram and the stuff that Kirtland has done.
        // If I can figure this out.... That's most of the project solved on my end.
    }
    
}

struct ReviewOrderScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewOrderScrollView()
    }
}


