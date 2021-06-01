//
//  UserOrdersSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/31/21.
//

import SwiftUI

struct showMenu:UIViewControllerRepresentable {
    func updateUIViewController(_ uiViewController: UserDashboardViewController, context: Context) {        
    }
    
    func makeUIViewController(context: Context) -> UserDashboardViewController {
        let vc = UserDashboardViewController()
        return vc
    }
}


struct UserOrdersSwiftUI: View {
    @Environment(\.managedObjectContext)
    var context
    @FetchRequest(entity: Product.entity(), sortDescriptors:[])
    
    var prod: FetchedResults<Product>
   // @FetchRequest(entity:User.entity(), sortDescriptors: keyPath,: \User.HistoryItems.date, ascending:true)
    
    //var history: FetchRequest<OrderHistory>
    @State var showVC = false
    var body: some View {
        Text("Show Users History as List")
        Text("Context exists \(context)")
        NavigationView {
            
        }.navigationBarTitle(Text("Menu"), displayMode:  .inline)
        .onTapGesture{
            showVC = true
        }
        .sheet(isPresented: $showVC)  {
            showMenu()
        }
    }// end body:view
}

struct UserOrdersSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserOrdersSwiftUI()
    }
}
