//
//  ChoosePaymentViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/27/21.
//

import UIKit

class ChoosePaymentViewController: UIViewController {

    @IBOutlet weak var userLabel: UILabel!
    var userVM : UserViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = LoginViewController.currentUser
        
        if user.name == "Guest" {
            userLabel.text = "Welcome!"
        } else {
            userLabel.text = "Hello \(user)"
        }
        
    }
    
    @IBAction func chooseCashOnDelivery(_ sender: Any) {
        // Update the database to show Cash on Delivery Method
        
    }
    
    @IBAction func chooseNetBanking(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "NetBanking") as! NetBankingViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    @IBAction func chooseCreditCard(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "CreditCardFrame") as! CreditCardFrameViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    @IBAction func goToStorefront(_ sender: Any) {
        
        self.dismiss(animated: true, completion: nil)
    }
    
    

}
