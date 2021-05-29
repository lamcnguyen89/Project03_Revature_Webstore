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
        NavigationView {
            Form{
                ForEach(0..<10){ i in
                    Button(action: {showProduct=true}) {
                        HStack{
                            Image("3060Ti")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 50, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            VStack(alignment: .leading){
                                Text("Item \(i)")
                                Divider()
                                Text("Price \(i)")
                                Divider()
                                Text("Quantity \(i)")
                            }.padding()
                            
                        }
                    }
                }
            }.navigationBarTitle("Review Order")
        }
    }
        
}

struct ReviewOrderScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewOrderScrollView()
    }
}

/*

 
 */
