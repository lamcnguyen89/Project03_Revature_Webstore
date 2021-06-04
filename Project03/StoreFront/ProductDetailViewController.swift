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
    var prodViewModel : ProductViewModel?
    var cartViewModel : ShoppingCartViewModel?


    override func viewDidLoad() {
        super.viewDidLoad()
        if prodViewModel != nil{
            desc.text = prodViewModel!.description
            productName.text = prodViewModel!.name
            img.image = UIImage(named: prodViewModel!.image)
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

    }

}
