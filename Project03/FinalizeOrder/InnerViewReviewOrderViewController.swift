//
//  InnerViewReviewOrderViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/28/21.
//

import UIKit

class InnerViewReviewOrderViewController: UIViewController {

 
    @IBOutlet weak var paymentType: UILabel!
    @IBOutlet weak var taxesLabel: UILabel!
    @IBOutlet weak var shippingLabel: UILabel!
    @IBOutlet weak var calculatedTotal: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    var tax: Double = 0
    let ship: Double = 20
    var payOption : PaymentType?
    var address : Address?
    var user = LoginViewController.currentUser
//    let orderData = [
//        0 : ["price" : 25.25, "quantity" : 2],
//        1 : ["price" : 100.36, "quantity" : 5],
//        2 : ["price" : 300.44, "quantity" : 13],
//        3 : ["price" : 200.2345, "quantity" : 8]
//    ]

    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
        let total = calculateOrder()
        taxesLabel.text = "Taxes: $\(String(format: "%.2f", tax))"
        shippingLabel.text = "Flate Rate Shipping: $\(String(format: "%.2f", ship))"
        

        let priceString : String = String(format: "%.2f", total)
        calculatedTotal.text = "Grand Total: $\(priceString)"

        NotificationCenter.default.addObserver(self, selector: #selector(reviewOrderDidUpdate), name: .shoppingCartDidUpdate, object: nil)

        payOption = user.paymentOptions?.array.first as? PaymentType
        address =  user.addresses!.array.first as? Address
        addressLabel.text = (address?.street)! + ", " + (address?.city!)!
        if payOption is ACH{
            let st = String((payOption as! ACH).routingNumber)
            paymentType.text = String("ACH to Bank with routing#: " + st)
        }
        else if payOption is CreditCard{
            //gets last 4 digits
            let st = String(((payOption as! CreditCard).number/1000000000000))
            paymentType.text = String("Credit Card with last 4 digits: " + st)
        }
    }
    
    @IBAction func submitOrder(_ sender: Any) {
        
        // Add a marker to the database showing that an order has been submitted, what was placed in the order and so on and so on.
        let order = Order(context: user.managedObjectContext!)
        order.user = user
        order.date = Date()
        order.payment = payOption
        order.address = address
        order.price = calculateOrder()
        for item in user.shoppingCart?.items?.array as! [ShoppingCartItem]{
            order.addToItems(item)
        }
        user.addToOrders(order)
        print(user.orders)

        
        
        // Redirect to Confirmation page
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Confirmation") as! OrderConfirmationViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    // Function to calculate the order total
    func calculateOrder()-> Double  {
        let taxRate = 0.05
        let orderData = LoginViewController.currentUser.shoppingCart?.items?.array as! [ShoppingCartItem]
        var totalPrice: Double = 0

        for item in orderData{
            totalPrice += (Double(item.number) * Double(item.product!.price))
        }
        // Call the object that shows the user's orders. Right now I'm just using a placeholder object to write and test this loop.
//        var perItemPriceArray = [Double]()
//        var i:Int = 0
//
//        while i < orderData.count {
//
//            let itemSubtotal = orderData[i]!["price"]! * orderData[i]!["quantity"]!
//            perItemPriceArray.append(itemSubtotal)
//            i += 1
//
//        }
        tax = taxRate*totalPrice
        totalPrice += (taxRate*totalPrice) + ship
        
        return totalPrice
        
    }
    
    func showPayment(){
       
    }
    @objc func reviewOrderDidUpdate(){
        self.viewDidLoad()
    }
    
 
}
