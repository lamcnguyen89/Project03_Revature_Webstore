//
//  UserOneOrderReview.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/4/21.
//

import SwiftUI

struct UserOneOrderReview: View {
    @State var isMenu:Bool = false
    @State private var isAllOrdersPresented = false
    @State private var isReturnItemPresented = false
    @State var prodName = ["Name 1", "Name 2", "Name 3", "Name 4"]
    
    var body: some View {
            List{
                ForEach(prodName, id:\.self){ product in
                       HStack{
                            Text("Product Name")
                            Image("6700XT").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                                      
                        Text("Total Price")
                        Image(systemName: "pencil")
                    }
                }
            }// end List
        
            Spacer()
        NavigationLink(destination: UserReturnsSwiftUIView()){

                Text("Return Items").foregroundColor(.white)
                .frame(maxWidth: .infinity).padding().background(Color.blue)
        }
 //           }
 //          .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
//           .edgesIgnoringSafeArea(.bottom)
    }// end body:view
}

struct UserOneOrderReview_Previews: PreviewProvider {
    static var previews: some View {
        UserOneOrderReview()
    }
}
