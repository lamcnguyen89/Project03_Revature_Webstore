//
//  CategoryScrollView.swift
//  Project03
//
//  Created by Kirtland Ross on 5/25/21.
//

import SwiftUI
import CoreData

struct ShoppingCartScrollView: View {
    
    
    var body: some View {
        Form{
            ForEach(0..<5){ _ in
                Button(action: {checkout()}) {
                    HStack{
                        Image("test")
                            .resizable()
                            .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Hello, World!")
                    }
                }
                HStack{
                    Image("test")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("2")
                }
                HStack{
                    Image("test")
                        .resizable()
                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    Text("3")
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
    }
    func checkout(){
        
    }
}

struct ShoppingCartScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ShoppingCartScrollView()
    }
}
