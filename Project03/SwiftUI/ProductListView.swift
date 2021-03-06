//
//  CategoryViewHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import SwiftUI
import UIKit
struct ProductListView: View {
    //toggle for displaying detail view
    @State private var showProduct = false

    private var csvLoaded : Bool
    private let user : UserViewModel?
    private let store: StoreViewModel?
    private let category : String
    //setup view model (maybe a store) that gets read in on init that holds the current category filter
    
    init (store: StoreViewModel, user : UserViewModel, category: String, csvLoaded: Bool){

        self.csvLoaded = csvLoaded
        self.user = user
        self.store = store
        self.category = category
    }
    init (csvLoaded: Bool){

        self.csvLoaded = csvLoaded
        self.user = nil
        self.category = "Featured"
        self.store = nil
    }
    var body: some View {
        if (store != nil){
            Form{
                ForEach(store!.filterProducts(category)){ item in
                    Button(action: {showProduct.toggle()}) {
                        VStack{
                            Image(item.image!)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300, alignment: .center)
                                .border(Color.orange, width: 3)
                                .cornerRadius(5.0)
                            
                            VStack{
                                
                                Text(String(item.name!)).frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.headline)
                                    .foregroundColor(.black)
                               
                                Spacer()
                                Text("Price: $\(String(format:"%.2f", item.price))")
                            }.padding().background(Color.orange)
                            .border(Color.blue, width: 3)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
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


