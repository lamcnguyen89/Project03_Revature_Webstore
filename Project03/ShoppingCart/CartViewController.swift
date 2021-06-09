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

        NotificationCenter.default.addObserver(self, selector: #selector(checkout(_:)), name: .checkout, object: nil)
    }
    @objc func checkout(_ notification: Notification){
        performSegue(withIdentifier: "checkout", sender: user)
    }
    
    @IBAction func userDashboard(_ sender: Any) {
        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
        
    }
    
}
