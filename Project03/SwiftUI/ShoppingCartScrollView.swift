//
//  CategoryScrollView.swift
//  Project03
//
//  Created by Kirtland Ross on 5/25/21.
//

import SwiftUI
import CoreData

struct ShoppingCartScrollView: View {
    @State private var showProduct = false
    
    var body: some View {
        Form{
            ForEach(0..<10){ i in
                Button(action: {showProduct=true}) {
                    HStack{
                        Image("test")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Test: " + String(i))
                    }
                }
            }
            Button(action: {checkout()}) {
                HStack{
                    Spacer()
                    Text("Checkout").frame( height: 100, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Spacer()
                }
            }
        }
        .sheet(isPresented: $showProduct, content: {
            ViewControllerAsUIView(storyboard: "Main", VC: "ProductDetail", prodData: nil, userVM: nil)
        })
    }
    func checkout(){
        
    }
}

//struct ShoppingCartScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        ShoppingCartScrollView()
//    }
//}
