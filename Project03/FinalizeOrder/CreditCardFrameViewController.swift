//
//  CreditCardFrameViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 6/4/21.
//

import UIKit

class CreditCardFrameViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    var userVM : UserViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let user = (parent as? StoreTabViewController)?.user {
            userVM = UserViewModel(user: user)
            userLabel.text = userVM?.greeting()
        }
        else{
            userLabel.text = "Welcome!"
        }
        
    }
   
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }

    @IBAction func goToStoreFront(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
}
