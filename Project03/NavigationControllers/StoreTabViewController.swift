//
//  StoreTabViewController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/4/21.
//

import UIKit

class StoreTabViewController: UITabBarController {
    var user : User?
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(onDidCompleteCSV(_:)), name: .didCompleteProductImport, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    //default to guest user
    @objc func onDidCompleteCSV(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            user = DataHandler().getGuestUser()

            //get the CategoryViewControllers from the children view controllers
            let categoryView = children.first { viewController in
                return viewController is CategoryViewController
            } as! CategoryViewController

            //set user and refresh categoryView controller
            categoryView.user = UserViewModel(user: user!)
            categoryView.viewDidLoad()
        }
    }
}
