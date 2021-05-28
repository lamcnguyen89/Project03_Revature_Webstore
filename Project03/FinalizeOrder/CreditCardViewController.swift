//
//  CreditCardViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class CreditCardViewController: UIViewController {
    
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var creditNumber: UITextField!
    @IBOutlet weak var expMonth: UITextField!
    @IBOutlet weak var expYear: UITextField!
    @IBOutlet weak var address: UITextField!
    @IBOutlet weak var address2: UITextField!
    @IBOutlet weak var city: UITextField!
    @IBOutlet weak var state: UITextField!
    @IBOutlet weak var zip: UITextField!
    @IBOutlet weak var phone: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    
    // Set Autorotation to false
    override open var shouldAutorotate: Bool {
        return false
    }
    
    // Specify the supported Orientation
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    

    
    
    @IBAction func submitInfo(_ sender: Any) {
        
        if(
            name.text != nil &&
            creditNumber.text != nil &&
            expMonth.text != nil &&
            expYear.text != nil &&
            expYear.text != nil &&
            address.text != nil &&
            city.text != nil &&
            state.text != nil &&
            zip.text != nil &&
            phone.text != nil
        ) {
           print("Card information submitted")

            
        } else {

        }
        
        
    }
    
}
