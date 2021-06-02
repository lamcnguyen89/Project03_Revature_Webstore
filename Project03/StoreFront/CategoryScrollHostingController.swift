//
//  CategoryScrollHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/2/21.
//

import UIKit
import SwiftUI
class CategoryScrollHostingController: UIHostingController<CategoryScrollView> {
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: CategoryScrollView(products: DataHandler().fetchAllProducts()))
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

}
