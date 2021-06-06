//
//  ProductDetailViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/24/21.
//

import UIKit

class ProductDetailViewController: UIViewController {

    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var numOfItems: UILabel!
    @IBOutlet weak var priceLabel: UITextField!
    var prodViewModel : ProductViewModel?
    var cartViewModel : ShoppingCartViewModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        if prodViewModel != nil{
            desc.text = prodViewModel!.description
            productName.text = prodViewModel!.name
            img.image = UIImage(named: prodViewModel!.image)
            priceLabel.text = prodViewModel!.price

        }
    }


    @IBAction func subItem(_ sender: Any) {
        numOfItems.text = cartViewModel?.preSubItem()
    }
    @IBAction func addItem(_ sender: Any) {
        numOfItems.text = cartViewModel?.preAddItem()
    }
    @IBAction func addToCart(_ sender: Any) {
        cartViewModel?.addItemsToCart(product: prodViewModel!.getObj())
        NotificationCenter.default.post(name: .shoppingCartDidUpdate, object: nil)
    }


    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    @IBAction func showStoreMenu(_ sender: UIButton) {
        let sb = UIStoryboard(name: "StoreMenu", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "storeMenu")
        self.present(show, animated: true, completion: nil)
        
    }
}
