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
    
    @State var user00 = Data(fname: "Jane", lname: "Doe", mailing: "123 Elms St", shipAdd: "123 Elms St", pwd: "jane123")
    @State var isMenu:Bool = false
    @State var newFName:String = "" // create function to check if valid
    @State var newLName:String = ""
    @State var oldPwd:String = ""
    @State var newPwd:String = ""
    @State var newMailingAdd:[String] = []
    @State var newShippingAdd:[String] = ["Street Address", "City", "State", "Zip"]
   
    var body: some View {
       VStack{
       HStack{
            Button(action:{isMenu = true})
            {
                Image(systemName: "chevron.backward")
            }.foregroundColor(.white)
             .padding()
            .sheet(isPresented: $isMenu) {
                showMenu()
            }
            Spacer()
            Text("My Account Services").font(.system(size: 20))
                .foregroundColor(Color.white).padding()
            }
           .frame(maxWidth: .infinity).background(Color.blue)
            List{
            Section(header:Text("Change Name")){
                   Text("Change your first and last name.")
                    HStack{
                        TextField("Enter new first name", text: $newFName).textFieldStyle(RoundedBorderTextFieldStyle()).border(Color.black)
                        Button(action:{
                            print("need to save data")
                        }){Image(systemName: "checkmark.square")
                        }.foregroundColor(.orange)
                    }
                    HStack{
                        TextField("Enter new last name", text: $newLName)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .border(Color.black)
                            Button(action:{
                                print("need to save data")
                            }){Image(systemName: "checkmark.square")
                            }.foregroundColor(.orange)
                        }
                Spacer()
            }// section 1
               Section(header:Text("Update Password")){
                Text("Type in most recent password")
                HStack{
                    TextField("Current password", text: $oldPwd).textFieldStyle(RoundedBorderTextFieldStyle()).border(Color.black)
                    Button(action:{
                        print("need to save data")
                    }){Image(systemName: "checkmark.square")
                    }.foregroundColor(.orange)                }
                HStack{
                    TextField("Enter new password", text: $newPwd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.black)
                    Button(action:{
                        print("need to save data")
                    }){Image(systemName: "checkmark.square")
                    }.foregroundColor(.orange)                     }
            }// section 2
            Spacer()
            Section(header:Text("Update Shipping Address")){
                Text("Current Address is:")
                HStack{
                    TextField("Enter Street Address", text: $newPwd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.black)
                    Button(action:{
                        print("need to save data")
                    }){Image(systemName: "checkmark.square")
                    }.foregroundColor(.orange)
               }
                HStack{
                    TextField("Enter City", text: $newPwd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.black)
                    Button(action:{
                        print("need to save data")
                    }){Image(systemName: "checkmark.square")
                    }.foregroundColor(.orange)
               }
                HStack{
                    TextField("Enter State", text: $newPwd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.black)
                    Button(action:{
                        print("need to save data")
                    }){Image(systemName: "checkmark.square")
                    }.foregroundColor(.orange)
               }
                HStack{
                    TextField("Enter Zip Code", text: $newPwd)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .border(Color.black)
                    Button(action:{
                        print("need to save data")
                    }){Image(systemName: "checkmark.square")
                    }.foregroundColor(.orange)
               }
           }// section 3
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
}

struct UserAccountSettingsSwiftUI_Previews: PreviewProvider {
    static var previews: some View {
        UserAccountSettingsSwiftUI()
    }
}
// call a storybaord view
struct showMenu : UIViewControllerRepresentable{
    func updateUIViewController(_ uiViewController: UserDashboardViewController, context: Context) {
    }
   
    func makeUIViewController(context: Context)-> UserDashboardViewController {
        let vc = UserDashboardViewController()
        return vc
    }
}

// not needed
struct Data:Identifiable {
    var id = UUID()
    var fname: String
    var lname: String
    var mailing: String
    var shipAdd: String
    var pwd: String
}


