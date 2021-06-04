//
//  UserWishlistSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct UserWishlistSwiftUI: View {
    
    @State var prodName = ["Name 1", "Name 2", "Name 3", "Name 4"]
    
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
        HStack{
         Image(systemName: "wand.and.stars")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
            Text("Wishlist").font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
            .padding()
        List{
            ForEach(prodName, id:\.self){ product in
                VStack{
                   HStack{
                        Text("Product Price")
                        Image("6700XT").resizable().aspectRatio(contentMode: .fit).padding()
                   }
                  
                    VStack{
                        
                        Text("Product Name /(product)").frame(maxWidth: .infinity, alignment: .trailing).padding()
                    }
                }
            }.onDelete(perform:removeFromWishlist)
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
    
    private func removeFromWishlist(at indexSet: IndexSet){
        
        self.prodName.remove(atOffsets: indexSet)
        /*
        guard let index = offsets.first else {
            return
        }
        
        managedObjectContext.delete(products[index])
        try? managedObjectContext.save()
         */
    }
    
}

struct UserWishlistSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserWishlistSwiftUI()
    }
}
