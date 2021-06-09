//
//  UserWishlistSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct CustomListRow{
    
    var id = UUID()
    let name: String
    let img: String
    let price: String
    
    init(name: String, img: String, price:String){
        self.name = name
        self.img = img
        self.price = price
    }
    var body: some View {
        VStack{
        Text("\(name)").frame(maxWidth: .infinity, alignment: .leading)
            .font(.headline)
            .foregroundColor(.blue)
        Image("\(img)")
                .resizable()
                .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .aspectRatio(contentMode: .fit)

        HStack{
            Spacer()
            Text("Price: \(price)")
        }.padding()
        .border(Color.orange, width: 3)
        .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
        }
    }
}

struct UserWishlistSwiftUI: View {
    
    @State var currentUser = DataHandler.inst.getGuestUser()
    @State var wishList = []
    @State var isWishList:String = "Suggested Items"
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
                ViewControllerAsUIView(storyboard: "Main", VC:"userDash" , prodData: nil, userVM: nil)
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
                       Text("\(prd.name)").frame(maxWidth: .infinity, alignment: .leading)
                                .font(.headline)
                                .foregroundColor(.blue)
                            Image("\(prd.image)")
                                    .resizable()
                                    .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    .aspectRatio(contentMode: .fit)
           
                            HStack{
                                Spacer()
                                Text("Price: \(prd.price)")
                            }.padding()
                            .border(Color.orange, width: 3)
                            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                        }
                }
                .onDelete(perform:removeFromWishlist)
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .edgesIgnoringSafeArea(.all)
                   
            }.navigationBarTitle("\(isWishList)", displayMode:.inline)
            .navigationBarItems(trailing:EditButton())
                
            }
            Text("Number of items in Wishlist: (wishList().count)")
                .padding()
                .font(.subheadline)
                .foregroundColor(.white)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
        
        
    }// end body:view
    
    private func removeFromWishlist(at indexSet: IndexSet){
        
        self.wishList.remove(atOffsets: indexSet)
        // save data to context
    }
    
    private func addItemToCart(){
        
    }
    
    private func getList() -> [ProductViewModel]{
            var list = [ProductViewModel]()
            var listType:String = ""
        
            for (k,v) in DataHandler.inst.getWishlist(user: currentUser){
                list.append(contentsOf: v)
                listType = k
            }
            if listType == "Suggested Items" {
                isWishList = "No items in Wishlist."
            } else {
                isWishList = "Your Wishlist"
            }
            return list
        }
    
}

struct UserWishlistSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserWishlistSwiftUI(currentUser: DataHandler.inst.getGuestUser())
    }
}
