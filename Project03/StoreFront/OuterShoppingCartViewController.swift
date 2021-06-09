//
//  OuterShoppingCartViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 6/5/21.
//

import UIKit

class OuterShoppingCartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
        
    @IBAction func showStoreMenu(_ sender: UIButton) {
        let sb = UIStoryboard(name: "StoreMenu", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "storeMenu")
        self.present(show, animated: true, completion: nil)
        
    }
    
    @IBAction func goToLogin(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "Login")
        self.present(show, animated: true, completion: nil)
    }
    

}
