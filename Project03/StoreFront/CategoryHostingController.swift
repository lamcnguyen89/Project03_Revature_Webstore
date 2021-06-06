//
//  CategoryScrollHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import UIKit
import SwiftUI
class CategoryHostingController: UIHostingController<ProductListView> {
    var user : UserViewModel?
    private var storeVM : StoreViewModel?
    var category = "Featured"
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: ProductListView(csvLoaded: false))
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompleteProductImport(_:)), name: .didCompleteProductImport, object: nil)
        user = nil
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // CSV done loading, reload SwiftUI view
    @objc func onDidCompleteProductImport(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            user = (parent as! CategoryViewController).user
            storeVM = StoreViewModel(store: DataHandler().fetchStore())
            reloadView()
        }
    }
    func reloadView(){
        rootView = ProductListView(store: storeVM!, user: user!, category: category, csvLoaded: true)
    }

}
