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
    @State var currentUser:User?
    @State var currentNum:String = ""
    @State private var isProductsInOrderPresented = false
        

    @State var userOrders : [String:[Order]]?
    @State var currentOrderNum:String = ""
    @State var demoOrder : [OrderData] = [.init(id: "OR-3456", price: 789.99)]
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
                    ForEach(demoOrder, id:\.id){ o in
                        NavigationLink(destination: OrderProductList(currentNum: o.id)){
                            VStack{
                                   HStack{
                                    Text("Order Number: \(o.id)").foregroundColor(Color.orange)
                                    Spacer()
                                   Text("Total Price: \(o.price)")
                                   }.padding(3)
                                   
                               }
                               .background(Color.white)
                               .padding(5)
                        }
                    }
                }
            }// end list
            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
            }.navigationBarHidden(true)
        }.frame(maxWidth: .infinity, maxHeight: .infinity).background(Color.blue)
        Spacer()
    }// end body:view

}

struct OrderData {
    var id: String
    var price: Double
    init(id:String, price: Double){
        self.id = id
        self.price = price
    }
}

struct UserOrdersSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserOrdersSwiftUI(currentUser:LoginViewController.currentUser)
    }
}

struct OrderProductList: View{
    @State var isMenu:Bool = false
    @State var isReturn:Bool = false
    //@State var row = 0
    @State var orderNum:String?
    @State var returnList = [String]()//add product.name if row btn checked
   // @State var product: [ProductViewModel] = DataHandler.inst.getSuggestedItemsList()
    
    @State var product: [Product] = [
        .init(orderNum: "OR-9678", name: "Product Name 1", image: "6700XT", totalPrice: "56.00", isAReturn: false),
        .init(orderNum: "OR-4784", name: "Product Name 2", image: "6700XT", totalPrice: "235.00", isAReturn: false),
        .init(orderNum: "OR-3456", name: "Product Name 3", image: "6700XT", totalPrice: "9000.00", isAReturn: false),
        .init(orderNum: "OR-1234", name: "Product Name 4", image: "6700XT", totalPrice: "299.00", isAReturn: false)
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
        NavigationLink(destination: UserReturnsSwiftUIView(returnList: returnList)){

                Text("Return Items").foregroundColor(.white)
                .frame(maxWidth: .infinity).padding().background(Color.blue)
        }
        
    }// end productlist.body
    
    private func updateReturnLst(prd:String, isBool: Bool){
        switch isBool{
        case true:
            returnList.append(prd)
        case false:
            for (i,v) in returnList.enumerated(){
                if v == prd {
                    returnList.remove(at: i)
                }
            }
        }
        
    }
    struct Product : Identifiable {
        let id = UUID()
        let orderNum: String
        var name:String
        var image: String
        var totalPrice: String
        var isAReturn:Bool
        }
}
