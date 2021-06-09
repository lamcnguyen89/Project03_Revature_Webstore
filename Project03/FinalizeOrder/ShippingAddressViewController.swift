//
//  ShippingAddressViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class ShippingAddressViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var country: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zipCode: UITextField!
    @IBOutlet weak var phone: UITextField!

    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

    }
    
    @IBAction func addAddress(_ sender: Any) {
        if(
            firstName.text != "" &&
            lastName.text != "" &&
            country.text != "" &&
            address.text != "" &&
            address2.text != "" &&
            city.text != "" &&
            state.text != "" &&
            zipCode.text != "" &&
            phone.text != ""
        ) {
            // Add Database Function to add address to user login account
            
            
            
            // Redirect to Review Order page
            let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let wel = sb.instantiateViewController(withIdentifier: "ReviewOrder") as! ReviewOrderViewController
            self.present(wel, animated: true, completion: nil)
        } else {
            print("Fill out all address fields")
        }
    }
    


}
