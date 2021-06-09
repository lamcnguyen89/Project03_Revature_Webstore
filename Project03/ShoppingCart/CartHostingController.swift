//
//  CategoryHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 5/26/21.
//

import UIKit
import SwiftUI
class CartHostingController:  UIHostingController<CartScrollView>, CheckoutDelegate{

    var userVM : UserViewModel?

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: CartScrollView(user: userVM))

        print(self)
        print(rootView.checkoutDelegate)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompleteUserImport(_:)), name: .didCompleteUserImport, object: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()
        rootView = CartScrollView(user: userVM, delegate: self)
    }
    func reloadScrollView(){
        userVM = (parent as! CartViewController).user
        rootView = CartScrollView(user: userVM, delegate: self)
    }
    @objc func onDidCompleteUserImport(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            userVM = (parent as! CartViewController).user
            rootView = CartScrollView(user: userVM, delegate: self)
        }
    }
    func onDidCheckout() {
       guard let tabBar = storyboard?.instantiateViewController(identifier: "Checkout", creator: { coder in
            return FinalizeOrderViewController(coder: coder, user: self.userVM!.getUser())
        })
       else{
        return print("view controller not found")
       }
        navigationController?.pushViewController(tabBar, animated: true)
    }
}
