//
//  ReviewOrderViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class ReviewOrderViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    var userVM : UserViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        let user = LoginViewController.currentUser
        
        if user.name == "Guest" {
            userLabel.text = "Welcome!"
        } else {
            userLabel.text = "Hello \(user.name)"
        }
        
    }
    
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }

    @IBAction func backToStoreFront(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
