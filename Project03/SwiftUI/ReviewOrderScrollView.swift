//
//  ReviewOrderScrollView.swift
//  Project03
//
//  Created by Lam Nguyen on 5/29/21.
//

import SwiftUI

struct ReviewOrderScrollView: View {
    @State var showProduct = false
    @State var isOn = false
    var body: some View {
        NavigationView{
            if #available(iOS 14.0, *) {
                VStack{
                    Form {
                        Toggle(isOn: $isOn, label: {
                            Text("Is Subscriber")
                        })
                        ForEach(0..<10){ i in
                            Button(action: {showProduct=true}) {
                                HStack{
                                    Image("test")
                                        .resizable()
                                        .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                                    Text("Test: " + String(i))
                                }
                            }
                        }                    }
                    Spacer()
                    }.navigationTitle("Review Items")
            } else {
                // Fallback on earlier versions
            }
        }
    }
}

struct ReviewOrderScrollView_Previews: PreviewProvider {
    static var previews: some View {
        ReviewOrderScrollView()
    }
}
