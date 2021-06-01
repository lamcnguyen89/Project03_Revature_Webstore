//
//  UserAccountSettingsSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct UserAccountSettingsSwiftUI: View {
    //@Environment(\.managedObjectContext)
    //var context
    @FetchRequest(entity:User.entity(), sortDescriptors:[
        NSSortDescriptor(keyPath:\User.lastName, ascending: true),
                    NSSortDescriptor(keyPath: \User.firstName, ascending: true)
                  ]
    )
    var user: FetchedResults<User>
    
    var body: some View {
        VStack{
            ScrollView {
                List(user, id:\.self){
                    u in
                    Text(u.lastName ?? "-No lastname")
                    Text(u.firstName ?? "-No firstname")
                    Spacer()
                    Text(u.password ?? "-password invalid")
                }
            }//scrollview
        }//vstack
    }
}

struct UserAccountSettingsSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountSettingsSwiftUI()
    }
}
