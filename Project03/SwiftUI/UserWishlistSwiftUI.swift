//
//  UserWishlistSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct UserWishlistSwiftUI: View {
    
    @State var isMenu:Bool = false
    var body: some View {
       VStack{
       HStack{
            Button(action:{isMenu = true})
            {
                Image(systemName: "chevron.backward")
            }.foregroundColor(.white)
             .padding()
            .sheet(isPresented: $isMenu) {
                
            }
            Spacer()
            Text("My Wishlist").font(.system(size: 20))
                .foregroundColor(Color.white).padding()
            }// en hstack
           .frame(maxWidth: .infinity).background(Color.blue)
        List{
           
           HStack{
                Text("Product Price")
                Image("RTX3070").resizable().aspectRatio(contentMode: .fit).padding()
           }
            VStack{
                
                Text("Product Name").frame(maxWidth: .infinity, alignment: .trailing).padding()
            }
            Spacer()
            HStack{
                 Text("Product Price")
                 Image("F150").resizable().aspectRatio(contentMode: .fit).padding()
            }
             VStack{
                 
                 Text("Product Name").frame(maxWidth: .infinity, alignment: .trailing).padding()
             }
         Spacer()
            
        }// end List
        .padding(20)
        Button(action:{})
            {
            Text("Continue Shopping").foregroundColor(.white)
        }.frame(maxWidth: .infinity).padding().background(Color.blue)
        }
       .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
       .edgesIgnoringSafeArea(.bottom)
    }// end body:view
}

struct UserWishlistSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserWishlistSwiftUI()
    }
}
