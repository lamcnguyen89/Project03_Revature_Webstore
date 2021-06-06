//
//  CreditCardFrameViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 6/4/21.
//

import UIKit

class CreditCardFrameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
   
    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }

}
