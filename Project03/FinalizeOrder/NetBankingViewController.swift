//
//  NetBankingViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 6/1/21.
//

import UIKit

class NetBankingViewController: UIViewController {

    @IBOutlet weak var accountName: UITextField!
    @IBOutlet weak var accountNumber: UITextField!
    @IBOutlet weak var routingNumber: UITextField!
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
    
    @IBAction func submitInfo(_ sender: Any) {
        
        if accountName.text != "" && accountNumber.text != "" && routingNumber.text != "" {
            
            let dic = ["acctNumber" : accountNumber.text,
                       "nameOnAccount" : accountName.text,
                       "routingNumber" : routingNumber.text
            ]
            
            // Push Net banking info to database:
            
            
            
            // Redirect to shipment page:
            let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let wel = sb.instantiateViewController(withIdentifier: "ChooseShipping") as! ChooseShippingViewController
            self.present(wel, animated: true, completion: nil)
            
        }
    }
    
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
