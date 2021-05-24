//
//  StoreMenu.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/22/21.
//

import SwiftUI


struct StoreMenu: View {
    
    var body: some View {
        VStack{
            Text("App Name")
                .foregroundColor(.black)
                .bold()
                .font(.headline)
            Spacer(minLength: 20)
            HStack{
                Button(action:{
                    print("Go to Graphics Card")
                })
                {
                    Text("Graphics Card")
                }
                .foregroundColor(.white)
                .frame(width:125, height: 125, alignment: .center)
                .padding(.top, 5.0)
                .background(Color.black)
                Spacer(minLength: 10)
                Button(action: {}, label: {
                    Text("Gym Equipment")
                })
                .foregroundColor(.white)
                .frame(width:125, height: 125, alignment: .center)

                .padding(.top, 5.0)
                .background(Color.black)
            }//end HStack
            HStack{
                Button(action:{
                    print("Go to Cars")
                })
                {
                    Text("Cars")
                }
                .foregroundColor(.white)
                .frame(width:125, height: 125, alignment: .center)
                .padding(.top, 5.0)
                .background(Color.black)
                Spacer(minLength: 10)
                Button(action: {}, label: {
                    Text("Cleaning Supplies")
                })
                .foregroundColor(.white)
                .frame(width:125, height: 125, alignment: .center)

                .padding(.top, 5.0)
                .background(Color.black)
            }//end HStack
            .padding(.top, 50.0)
               
        }// end outer VStack
        .frame(width: 300.0, height:400, alignment:.center)
        //.background(Color.black)
    }// end body
    
}

struct StoreMenu_Previews: PreviewProvider {
    static var previews: some View {
        StoreMenu()
    }
}
