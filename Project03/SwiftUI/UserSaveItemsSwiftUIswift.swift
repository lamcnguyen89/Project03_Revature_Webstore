//
//  UserSaveItemsSwiftUIswift.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct UserSaveItemsSwiftUIswift: View {
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
                
               ViewControllerAsUIView(storyboard: "Main", VC:"userDash" , prodData: nil, userVM: nil)
            }
            Spacer()
            Text("My Saved Items").font(.system(size: 20))
                .foregroundColor(Color.white).padding()
            }// en hstack
           .frame(maxWidth: .infinity).background(Color.blue)
        HStack{
         Image(systemName: "square.and.arrow.up.fill")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50)
            .foregroundColor(.white)
            Text("Save Items").font(.largeTitle)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: 200)
            .padding()
        List{
            ForEach(prodName, id:\.self){ product in
                VStack{
                  
                    Image("6700XT")
                        .resizable()
                        .frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        .aspectRatio(contentMode: .fit)
                       // .padding()
                        .border(Color.blue, width: 3)
                        .cornerRadius(5.0)
                    
                    VStack{
                        
                        Text("Product Name").frame(maxWidth: .infinity, alignment: .leading)
                            .font(.headline)
                            .foregroundColor(.white)
                        Spacer()
                        Text("Price: Product Price")
                    }.padding().background(Color.blue)
                    .border(Color.orange, width: 3)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    
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

struct UserSaveItemsSwiftUIswift_Previews: PreviewProvider {
    static var previews: some View {
        UserSaveItemsSwiftUIswift()
    }
}
