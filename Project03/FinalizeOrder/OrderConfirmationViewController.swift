//
//  OrderConfirmationViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class OrderConfirmationViewController: UIViewController {

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
        // Do any additional setup after loading the view.
    }
    
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    @IBAction func backToStoreFront(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }}
