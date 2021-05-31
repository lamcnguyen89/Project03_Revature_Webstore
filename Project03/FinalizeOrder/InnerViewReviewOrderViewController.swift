//
//  InnerViewReviewOrderViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class InnerViewReviewOrderViewController: UIViewController {

    @IBOutlet weak var calculatedTotal: UILabel!
    var totalPrice: Double = 0
    var taxes: Double = 0
    var shipping: Double = 20
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        calculateOrder()
    }
    
    @IBAction func submitOrder(_ sender: Any) {
        
        // Add a marker to the database showing that an order has been submitted, what was placed in the order and so on and so on.
        
        // Redirect to Confirmation page
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Confirmation") as! OrderConfirmationViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    // Function to calculate the order total
    func calculateOrder() {
        
        // Call the object that shows the user's orders. Right now I'm just using a placeholder object to write and test this loop.
        let orderData = [
            0 : ["price" : 25.25, "quantity" : 2],
            1 : ["price" : 100.36, "quantity" : 5],
            2 : ["price" : 300.44, "quantity" : 13],
            3 : ["price" : 200.2345, "quantity" : 8]
        ]
        
        var perItemPriceArray = [Double]()
        
        var i:Int = 0
        
        while i < orderData.count {
            
            let itemSubtotal = orderData[i]!["price"]! * orderData[i]!["quantity"]!
            perItemPriceArray.append(itemSubtotal)
            i += 1
            
        }
        
        totalPrice = perItemPriceArray.reduce(0, +) + taxes + shipping
        let priceString : String = String(format: "%.2f", totalPrice)
        calculatedTotal.text = "$\(priceString)"
        
    }
    


}
