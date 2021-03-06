//
//  ChooseShippingViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/27/21.
//

import UIKit

class ChooseShippingViewController: UIViewController {
    
    @IBOutlet weak var userLabel: UILabel!
    var userVM : UserViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        let user = LoginViewController.currentUser
        
        if user.name == "Guest" {
            userLabel.text = "Welcom!"
        } else {
            userLabel.text = "Hello \(user.name)"
        }
    }
    

    @IBAction func userDashboard(_ sender: Any) {
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    
    @IBAction func backtoStoreFront(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
