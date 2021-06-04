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
    private let user : UserViewModel?
    init (products: [Product], user : UserViewModel ,csvLoaded: Bool){
        self.products = products
        self.csvLoaded = csvLoaded
        self.user = user
    }
    init (csvLoaded: Bool){
        products = [Product]()
        self.csvLoaded = csvLoaded
        self.user = nil
    }
    var body: some View {
        if (csvLoaded){
            Form{
                ForEach(products){ item in
                    Button(action: {showProduct.toggle()}) {
                        HStack{
                            Image(item.image!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            Text(String(item.name!))
                        }
                    }.sheet(isPresented: $showProduct) {
                        ViewControllerAsUIView(storyboard: "Main", VC: "ProductDetail", prodData: item, userVM: user)
                    }
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
}


//struct CategoryScrollView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoryScrollView()
//    }
//}

