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
            let alert = UIAlertController(title: "Address Added", message: "Address has been added", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {action in
                self.firstName.text = ""
                self.lastName.text = ""
                self.country.text = ""
                self.address.text = ""
                self.address2.text = ""
                self.city.text = ""
                self.state.text = ""
                self.zipCode.text = ""
                self.phone.text = ""
                
                
                
            }))
            
            self.present(alert, animated: true)
            

        } else {
            print("Fill out all address fields")
        }
    }
    


}
