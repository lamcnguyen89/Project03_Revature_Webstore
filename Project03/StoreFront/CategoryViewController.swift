//
//  CategoryViewController.swift
//  Purpose
//  Show a gallery of availble products where user
//  can scroll view gallery, add product to a wish list
//  ,add to a shopping cart, and click image to view
//   details about the product.

//  This view has two subviews:
//  ProductListViewController & ProductDetailViewController
//
//  Created by Lam Nguyen on 5/24/21.

import UIKit

class CategoryViewController: UIViewController {
    
    var answer: Int!
    var category: String?

    @IBOutlet weak var galleryView: UIView!
    @IBOutlet weak var productDetailView: UIView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        galleryView.isHidden = false
//        productDetailView.isHidden = true
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
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
    
    @IBAction func goToShoppingCart(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "shoppingCart")
        self.present(show, animated: true, completion: nil)
    }
    
    
}

