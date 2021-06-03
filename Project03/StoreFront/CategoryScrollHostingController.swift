//
//  CategoryScrollHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import UIKit
import SwiftUI
class CategoryScrollHostingController: UIHostingController<ProductListView> {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: ProductListView(csvLoaded: false))
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompleteCSV(_:)), name: .didCompleteCSV, object: nil)

    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    // CSV done loading, reload SwiftUI view
    @objc func onDidCompleteCSV(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            rootView = ProductListView(products: DataHandler().fetchAllProducts(), csvLoaded: true)
        }
    }
 

}
