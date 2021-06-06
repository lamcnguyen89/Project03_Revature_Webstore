//
//  CartViewController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/4/21.
//

import UIKit

class CartViewController: UIViewController {
    @IBOutlet weak var userLabel: UILabel!
    
    var user : UserViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        user = UserViewModel(user: (parent as! StoreTabViewController).user!)
        if user == nil{
            userLabel.text = "Welcome!"
        }
        else{
            userLabel.text = user?.greeting()
        }

        let hostingController = children.first { viewController in
            viewController is ShoppingCartHostingController
        } as! ShoppingCartHostingController
        hostingController.reloadScrollView()
    }

}
