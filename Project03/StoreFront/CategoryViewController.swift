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

    @IBOutlet weak var galleryView: UIView!
    @IBOutlet weak var productDetailView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        galleryView.isHidden = false
        productDetailView.isHidden = true
        
    }

    @IBAction func getUserDashboard(_ sender: UIButton) {
        print("go to user dash")
        let getSB = UIStoryboard(name: "UserDashboard", bundle: nil)
        let show = getSB.instantiateViewController(withIdentifier: "userTabNav") as! UserTabNavViewController
        
        self.present(show, animated: true, completion: nil)
        
        
    }
}
