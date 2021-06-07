//
//  UserReturnsSwiftUIView.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/6/21.
//

import SwiftUI

struct UserReturnsSwiftUIView: View {
    
    var returnList = [String]()
    
    var body: some View {

        if returnList.isEmpty{
            Text("You have not chosen any items to return. Please return to previous screen.")
        }

        List(returnList, id:\.self){ prd in
            Text("\(prd)")
        }
        Spacer()
        NavigationLink(destination: UserOrdersSwiftUI()){

            Text("Confirm Return Items").foregroundColor(.white)

                .frame(maxWidth: .infinity).padding().background(Color.blue)

        }
        
    }// end body
}

struct UserReturnsSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        UserReturnsSwiftUIView()
    }
}
