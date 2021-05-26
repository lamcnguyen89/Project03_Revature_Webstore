//
//  CategoryHostingController.swift
//  Project03
//
//  Created by Kirtland Ross on 5/26/21.
//

import UIKit
import SwiftUI
class ShoppingCartHostingController:  UIHostingController<ShoppingCartScrollView>{

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: ShoppingCartScrollView())
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}
