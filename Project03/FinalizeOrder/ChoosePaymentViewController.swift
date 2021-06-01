//
//  ChoosePaymentViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/27/21.
//

import UIKit

class ChoosePaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func chooseCashOnDelivery(_ sender: Any) {
        // Update the database to show Cash on Delivery Method
    }
    
    @IBAction func chooseNetBanking(_ sender: Any) {
        // Update the database to show Net Banking
    }
    
    @IBAction func chooseCreditCard(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "CreditCard") as! CreditCardViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    

}
