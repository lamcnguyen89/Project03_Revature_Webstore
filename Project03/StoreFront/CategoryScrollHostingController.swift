//
//  CategoryScrollHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import UIKit
import SwiftUI
class CategoryScrollHostingController: UIHostingController<ProductListView> {
    var user : UserViewModel?

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: ProductListView(csvLoaded: false))
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompleteCSV(_:)), name: .didCompleteProductImport, object: nil)
        user = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // CSV done loading, reload SwiftUI view
    @objc func onDidCompleteCSV(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            user = (parent as! CategoryViewController).user
            rootView = ProductListView(products: DataHandler().fetchAllProducts(), user: user!, csvLoaded: true)
        }
    }
 

}
