//
//  UserOrdersSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/31/21.
//

import SwiftUI

struct UserOrdersSwiftUI: View {
    @Environment(\.managedObjectContext)
    var context
    //@FetchRequest(entity: Product.entity(), sortDescriptors:[])
    
   // var prod: FetchedResults<Product>
   // @FetchRequest(entity:User.entity(), sortDescriptors: keyPath,: \User.HistoryItems.date, ascending:true)
    
    //var history: FetchRequest<OrderHistory>
    
    var body: some View {
        Text("Show Users History as List")
        Text("Context exists \(context)")        
    }// end body:view
}

struct UserOrdersSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserOrdersSwiftUI()
    }
}
