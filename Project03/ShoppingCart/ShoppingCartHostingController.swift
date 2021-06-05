//
//  CategoryHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 5/26/21.
//

import UIKit
import SwiftUI
class ShoppingCartHostingController:  UIHostingController<ShoppingCartScrollView>{
    var user : UserViewModel?

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: ShoppingCartScrollView(user: user))
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompleteCSV(_:)), name: .didCompleteUserImport, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func reloadScrollView(){
        user = (parent as! CartViewController).user
        rootView = ShoppingCartScrollView(user: user)
    }
    @objc func onDidCompleteCSV(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            user = (parent as! CartViewController).user
            rootView = ShoppingCartScrollView(user: user)
        }
    }
}
