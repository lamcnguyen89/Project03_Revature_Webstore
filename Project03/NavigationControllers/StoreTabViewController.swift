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
        NotificationCenter.default.addObserver(self, selector: #selector(didCompleteUserImport(_:)), name: .didCompleteUserImport, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(shoppingCartDidUpdate(_:)), name: .shoppingCartDidUpdate, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    //default to guest user
    @objc func didCompleteUserImport(_ notification: Notification)
    {
        //resync on main thread, otherwise it will crash
        DispatchQueue.main.sync {
            user = DataHandler().getGuestUser()

            //get the CategoryViewControllers from the children view controllers
            let categoryView = children.first { viewController in
                return viewController is CategoryViewController
            } as! CategoryViewController

            //check if view has loaded
            if categoryView.isViewLoaded{
                //set user and refresh categoryView controller
                categoryView.userVM = UserViewModel(user: user!)
                categoryView.viewDidLoad()
            }
        }
    }
    @objc func shoppingCartDidUpdate(_ notification: Notification){

        let cartViewController = children.first { viewController in
            return viewController is CartViewController
        } as! CartViewController
        //if view is loaded, reload
        if cartViewController.isViewLoaded{
            cartViewController.viewDidLoad()
        }
    }
}
