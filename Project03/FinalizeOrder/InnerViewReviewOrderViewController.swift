//
//  InnerViewReviewOrderViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class InnerViewReviewOrderViewController: UIViewController {

 
    @IBOutlet weak var taxesLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var calculatedTotal: UILabel!
    let tax: Double = 0
    let ship: Double = 20
    
    let orderData1 = [
        0 : ["price" : 25.25, "quantity" : 2],
        1 : ["price" : 100.36, "quantity" : 5],
        2 : ["price" : 300.44, "quantity" : 13],
        3 : ["price" : 200.2345, "quantity" : 8]
    ]
    
    let orderData2 = [
        0 : ["price" : 425.50, "quantity" : 4],
        1 : ["price" : 200.50, "quantity" : 5],
        2 : ["price" : 300.50, "quantity" : 6],
        3 : ["price" : 600.50, "quantity" : 7],
        4 : ["price" : 500.50, "quantity" : 2]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        taxesLabel.text = "Taxes: $\(String(format: "%.2f", tax))"
        shippingLabel.text = "Flate Rate Shipping: $\(String(format: "%.2f", ship))"
        
        let total = calculateOrder(orders: orderData2)
        let priceString : String = String(format: "%.2f", total)
        calculatedTotal.text = priceString
    }
    
    @IBAction func submitOrder(_ sender: Any) {
        
        // Add a marker to the database showing that an order has been submitted, what was placed in the order and so on and so on.
        
        // Redirect to Confirmation page
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Confirmation") as! OrderConfirmationViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    // Function to calculate the order total
    func calculateOrder(orders: [Int : [String : Double]] )-> Double  {
        
        let orderData = orders
       
        
        var totalPrice: Double = 0

        // Call the object that shows the user's orders. Right now I'm just using a placeholder object to write and test this loop.
        
        var perItemPriceArray = [Double]()
        
        var i:Int = 0
        
        while i < orderData.count {
            
            let itemSubtotal = orderData[i]!["price"]! * orderData[i]!["quantity"]!
            perItemPriceArray.append(itemSubtotal)
            i += 1
            
        }
        
        totalPrice = perItemPriceArray.reduce(0, +) + tax + ship
        
        return totalPrice
        
    }
    


}
