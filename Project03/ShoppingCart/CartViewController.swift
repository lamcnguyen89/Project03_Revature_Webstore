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
        let parentUser = (parent as! StoreTabViewController).user!
        user = UserViewModel(user: parentUser)
        if user == nil{
            userLabel.text = "Welcome!"
        }
        else{
            userLabel.text = user?.greeting()
        }

        let hostingController = children.first { viewController in
            viewController is CartHostingController
        } as! CartHostingController
        hostingController.reloadScrollView()
    }

}
