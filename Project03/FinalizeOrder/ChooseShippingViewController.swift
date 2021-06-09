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

        // Do any additional setup after loading the view.
        if let user = (parent as? StoreTabViewController)?.user {
            userVM = UserViewModel(user: user)
            userLabel.text = userVM?.greeting()
        }
        else{
            userLabel.text = "Welcome!"
        }
        
    }
    

    @IBAction func userDashboard(_ sender: Any) {
        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    
    @IBAction func backtoStoreFront(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
