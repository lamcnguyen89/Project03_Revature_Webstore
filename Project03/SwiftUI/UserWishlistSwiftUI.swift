//
//  UserWishlistSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct Item {
    var id = UUID()
    var product = [ProductViewModel]()
}

struct UserWishlistSwiftUI: View {
    
    @State var currentUser = DataHandler.inst.getGuestUser()
    @State var wishList = []
    @State var isWishList:String = ""
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
                    ForEach(getList(), id: \.name){ prd in
                        VStack{
                           HStack{
                                Image("\(prd.image)").resizable()
                                    .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .aspectRatio(contentMode: .fill).padding().border(Color.blue, width: 3).cornerRadius(5.0)
                           }
                            VStack{
                                
                                Text("\(prd.name)").frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.caption)
                                    .foregroundColor(.white)
                                Spacer()
                                Text("Price: \(prd.price)")
                            }.padding().background(Color.blue)
                            .border(Color.orange, width: 3)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                    }.onDelete(perform:removeFromWishlist)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity).edgesIgnoringSafeArea(.bottom)
                .navigationBarTitle("Add Item to Cart", displayMode: .inline)
                .navigationBarItems(trailing:
                                        EditButton())
            }
            Text("Number of items in Wishlist: \(getList().count)")
                .padding()
                .font(.subheadline)
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
        
        
    }// end body:view
    
    private func removeFromWishlist(at indexSet: IndexSet){
        
        //self.list.remove(atOffsets: indexSet)
        // save data to context
    }
    
    private func addItemToCart(){
        
    }
    
    private func getList() -> [ProductViewModel]{
        var list = [ProductViewModel]()
        for (k,v) in DataHandler.inst.getWishlist(user: currentUser){
            list.append(contentsOf: v)
            wishList.append(contentsOf: v)
            isWishList = k
        }
        return list
    }
 
}

struct UserWishlistSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserWishlistSwiftUI()
    }
}
