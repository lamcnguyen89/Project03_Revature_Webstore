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
    @IBOutlet weak var price: UILabel!
    var viewModel : ProductViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        if viewModel != nil{
            desc.text = viewModel!.description
            productName.text = viewModel!.name
            img.image = UIImage(named: viewModel!.image)
            price.text = "$\(String(format: "%.2f", viewModel!.price))"
        }
        // Do any additional setup after loading the view.
    }
}
