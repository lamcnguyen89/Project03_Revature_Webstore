//
//  CategoryViewHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import SwiftUI
import UIKit
struct ProductListView: View {
    @State private var showProduct = false
    private var csvLoaded : Bool
    private let products : [Product]
    init (products: [Product], csvLoaded: Bool){
        self.products = products
        self.csvLoaded = csvLoaded
    }
    init (csvLoaded: Bool){
        products = [Product]()
        self.csvLoaded = csvLoaded
    }
    var body: some View {
        if (csvLoaded){
        Form{
            ForEach(products){ item in
                Button(action: {showProduct=true}) {
                    HStack{
                        Image(item.image!)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        VStack(alignment: .leading){
                            Text(String(item.name!))
                            Divider()
                            Text("Price: $\(String(format: "%.2f", item.price))")
                        }
                     
                    }
                }.sheet(isPresented: $showProduct, content: {
                    ViewControllerAsUIView(storyboard: "Main", VC: "ProductDetail", prodData: item)
                })
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

    }
}


//struct CategoryScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollView()
//    }
//}


struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
