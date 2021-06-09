//
//  CartViewController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/4/21.
//

import UIKit

class CartViewController: UIViewController {
    var userVM : UserViewModel?
    @IBOutlet weak var userLabel: UILabel!
    
    var user : UserViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = (parent as? StoreTabViewController)?.user {
            userVM = UserViewModel(user: user)
            userLabel.text = userVM?.greeting()
        }
        else{
            userLabel.text = "Welcome!"
        }
        
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

    
    @IBAction func userDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
            
    @IBAction func goToStorefront(_ sender: Any) {
        tabBarController?.selectedIndex = 0
        
    }
    
}
