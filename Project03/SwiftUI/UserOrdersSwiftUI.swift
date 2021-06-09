//
//  UserOrdersSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/3/21.
//

import SwiftUI

/*
struct OrderRowView: View {
    
    var body: some View {
        VStack{
               HStack{
               Text("Order Date")
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
*/
struct UserOrdersSwiftUI: View {
    @State var isMenu:Bool = false
    @State var testDB:[String] = DataHandler.inst.getProductName()
    @State var currentUser:User

   // @State private var isProductsInOrderPresented = false
        

    @State var userOrders : [String:String] = DataHandler.inst.demoGetUserOrders(user: "lea.leonard1")
    @State var currentOrderNum:String = ""
    @State var demoOrder:[String]
    
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
                        ViewControllerAsUIView(storyboard: "Main", VC:"userDash" , prodData: nil, userVM: nil)
                     }
                     Spacer()
                     Text("My Recent Orders").font(.system(size: 20))
                         .foregroundColor(Color.white).padding()
                     }// header hStack
                .frame(maxWidth: .infinity)
                .background(Color.blue)

                Spacer()
                /*
                NavigationLink(destination:UserSaveItemsSwiftUIswift()){
                        Text("Account Menu")
                            .foregroundColor(.white)
                    }.padding()
        */
                //Spacer()
                }// header hStack
                .frame(maxWidth: .infinity)
           //     .background(Color.white)
            HStack{
             Image(systemName: "shippingbox.fill")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .foregroundColor(.white)
                Text("My Orders").font(.largeTitle)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, maxHeight: 100)
            //    .padding()
            NavigationView{
            List{
                 Section(header: Text("Order by most recent")){
                    ForEach(demoOrder, id:\.self){ num in
                    
                        NavigationLink(destination: OrderProductList(currentNum: num)){
                            VStack{
                                   HStack{
                                   Text("Order Number: \(num)")
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
                }
            }// end list
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }.navigationBarHidden(true)
        }
            /*
            Spacer()
            Button(action:{})
                {
                Text("Continue Shopping").foregroundColor(.white)
            }.frame(maxWidth: .infinity).padding().background(Color.blue)
 */
        .frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
        Spacer()
    }// end body:view
    
}

struct UserOrdersSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserOrdersSwiftUI(currentUser:LoginViewController.currentUser}
}

struct OrderProductList: View{
    @State var isMenu:Bool = false
    
    @State var isReturn:Bool = false
    @State var row = 0
    @State var lstReturnProduct = [String]()//add product.name if row btn checked
    @State var product: [Product] = [
        .init(name: "Name 1", image: "6700XT", totalPrice: "56.00", isAReturn: false),
        .init(name: "Name 2", image: "6700XT", totalPrice: "235.00", isAReturn: false),
        .init(name: "Name 3", image: "6700XT", totalPrice: "9000.00", isAReturn: false),
        .init(name: "Name 4", image: "6700XT", totalPrice: "299.00", isAReturn: false)
    ]
    @State var select = Set<UUID>()
    var currentNum:String = "Goes Here"
    
    var body: some View {
        Text("Order Number: \(currentNum)")
        NavigationView{
            List(selection: $select){
                ForEach(product) { p in
                     HStack{
                        
                        Text("Product Name \(p.name)")
                            Image("\(p.image)").resizable().aspectRatio(contentMode: .fit)
                                .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                .padding()
                        //Text("Total: \(p.totalPrice)")
                     }.onTapGesture{
                        isReturn.toggle()
                        self.updateReturnLst(prd: p.name, isBool: isReturn)
                    }
                }
            }// end List
            .navigationBarItems(trailing: EditButton())
        }
        Spacer()
        NavigationLink(destination: UserReturnsSwiftUIView(returnList: lstReturnProduct)){

                Text("Return Items").foregroundColor(.white)
                .frame(maxWidth: .infinity).padding().background(Color.blue)
        }
        
    }// end productlist.body
    
    private func updateReturnLst(prd:String, isBool: Bool){
        switch isBool{
        case true:
            lstReturnProduct.append(prd)
        case false:
            for (i,v) in lstReturnProduct.enumerated(){
                if v == prd {
                    lstReturnProduct.remove(at: i)
                }
            }
        }
        
    }
    struct Product : Identifiable {
        let id = UUID()
        var name:String
        var image: String
        var totalPrice: String
        var isAReturn:Bool
        }
}
