//
//  UserAccountSettingsSwiftUI.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/1/21.
//

import SwiftUI

struct UserAccountSettingsSwiftUI: View {
  //  @Environment(\.managedObjectContext) var context;
  //  @FetchRequest(entity:User.entity(), sortDescriptors:[])
  //  var user: FetchedResults<User>
    var sampleUser = ["00":["fName":"Jane", "lName": "Doe", "add": "123 elms st", "pwd": "1234"]],
        ["01": [""]]
    
    
    var body: some View {
        VStack{
            ScrollView {
                List(prods){ p in
                    Text("\(p.name!)")
                    Spacer()
                    Text("\(p.price)")
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
