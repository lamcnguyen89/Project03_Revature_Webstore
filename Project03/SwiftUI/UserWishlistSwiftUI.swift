//
//  UserWishlistSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct UserWishlistSwiftUI: View {
    
    @State var testDB:[String] = DataHandler.inst.getProductName()
    @State var select = Set<UUID>()
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
                ViewControllerAsUIView(storyboard: "UserDashboard", VC:"userDash" , prodData: nil, userVM: nil)
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
            Text("My Wishlist").font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 100)
            .padding()
            NavigationView{
                List(selection: $select){
                ForEach(testDB, id:\.self){ product in
                        VStack{
                           HStack{
                                Text("Product Price")
                                Image("6700XT").resizable().aspectRatio(contentMode: .fit).padding()
                           }
                          
                            VStack{
                                
                                Text("\(product)").frame(maxWidth: .infinity, alignment: .trailing).padding()
                            }
                        }
                    }.onDelete(perform:removeFromWishlist)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle("Add Item to Cart", displayMode: .inline)
                .navigationBarItems(trailing:
                                        EditButton())
            }
            Text("Number of items in Wishlist: \(testDB.count)")
                .padding()
                .font(.subheadline)
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
        
        
    }// end body:view
    
    private func removeFromWishlist(at indexSet: IndexSet){
        
        self.testDB.remove(atOffsets: indexSet)
        // save data to context
        /*
        guard let index = offsets.first else {
            return
        }
        
        managedObjectContext.delete(products[index])
        try? managedObjectContext.save()
         */
    }
    
    private func addItemToCart(){
        
    }
}

struct UserWishlistSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserWishlistSwiftUI()
    }
}
