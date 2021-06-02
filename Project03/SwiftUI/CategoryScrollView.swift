//
//  CategoryViewHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import SwiftUI
import UIKit
struct CategoryScrollView: View {
    @State private var showProduct = false
    @State private var csvLoaded = false
    private let products : [Product]
    init (products: [Product]){
        self.products = products
    }
    init (){
        products = [Product]()
    }
    var body: some View {
        Form{
            ForEach(products){ item in
                Button(action: {showProduct=true}) {
                    HStack{
                        Image(item.image!)
                            .resizable()
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text("Name: " + String(item.name!))
                    }
                }
            }
        }
        .sheet(isPresented: $showProduct, content: {
            ViewControllerAsUIView(storyboard: "Main", VC: "ProductDetail")
        })
    }

    func checkout(){

    }
}


//struct CategoryScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollView()
//    }
//}
