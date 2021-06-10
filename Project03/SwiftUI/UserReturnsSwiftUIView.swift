//
//  UserReturnsSwiftUIView.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/6/21.
//

import SwiftUI

struct UserReturnsSwiftUIView: View {
    
    @State var returnList = [String]()
    
    var body: some View {

        if returnList.isEmpty{
            Text("You have not chosen any items to return. Please return to previous screen.")
        }

        List(returnList, id:\.self){ prd in
            Text("\(prd)")
        }
        Spacer()
        NavigationLink(destination: ReturnConfirmationSwiftUIView(returns: returnList)){

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

struct ReturnConfirmationSwiftUIView: View {
    
    @State var returns = [String]()
    
    var body: some View {

        if returns.isEmpty{
            Text("You have not chosen any items to return. Please return to previous screen.")
        } else {
            Text("The following items will be return!").font(.subheadline).foregroundColor(.orange)
            List(returns, id:\.self){ prd in
                Text("\(prd)")
            }
            Spacer()
        

        }
        

        
        
    }// end body
}


