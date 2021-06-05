//
//  UserOrdersSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/3/21.
//

import SwiftUI

struct OrderRowView: View {
    var orderNum: String = "OR1234"
    var body: some View {
        VStack{
               HStack{
               Text("Order Date \(orderNum)")
               Spacer()
               Text("Total Price")
               }.padding(3)
               HStack{
                   Text("[Delivered |On its Way]")
                       .foregroundColor(Color.orange)
                   Spacer()
               }.padding()
           }
           .background(Color.white)
           .padding(5)
    }
}

struct UserOrdersSwiftUI: View {
    @Environment(\.managedObjectContext)
    var context
    //@FetchRequest(entity: Product.entity(), sortDescriptors:[])
    
   // var prod: FetchedResults<Product>
   // @FetchRequest(entity:User.entity(), sortDescriptors: keyPath,: \User.HistoryItems.date, ascending:true)
    
    //var history: FetchRequest<OrderHistory>
    @State var isMenu:Bool = false
    @State private var isProductsInOrderPresented = false
    
    var body: some View {
        VStack{
            ZStack{
                HStack{
                     Button(action:{isMenu = true})
                     {
                         Image(systemName: "chevron.backward")
                     }.foregroundColor(.white)
                      .padding()
                     .sheet(isPresented: $isMenu) {
                         
                     }
                     Spacer()
                     Text("My Recent Orders").font(.system(size: 20))
                         .foregroundColor(Color.white).padding()
                     }// header hStack
                .frame(maxWidth: .infinity)
                .background(Color.blue)
                Spacer()
            }
            HStack{
             Image(systemName: "shippingbox.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                Text("Orders").font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 200)
                .padding()
            List{
             ForEach(0..<10){ order in
               // NavigationLink(destination: OrderProductList()) {
               //     OrderRowView()
              //  }// navigation link
                OrderRowView().onTapGesture(count: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/, perform: {
                    print("made a tap on \(order)")
                    isProductsInOrderPresented = true
                }).sheet(isPresented: $isProductsInOrderPresented){
                    UserOneOrderReview()
                }
             }
            }
            Spacer()
            Button(action:{})
                {
                Text("Continue Shopping").foregroundColor(.white)
            }.frame(maxWidth: .infinity).padding().background(Color.blue)
            }
           .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
           .edgesIgnoringSafeArea(.bottom)
    }// end body:view
}

struct UserOrdersSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserOrdersSwiftUI()
    }
}

struct OrderProductList: View{
    var body: some View {
        Text("View list of products in orders")
    }
}
