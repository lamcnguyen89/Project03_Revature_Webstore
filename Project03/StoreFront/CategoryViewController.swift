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


    @IBOutlet weak var galleryView: UIView!
    @IBOutlet weak var productDetailView: UIView!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
//        galleryView.isHidden = false
//        productDetailView.isHidden = true
        
    }
    
    func subtractor(input1: Int, input2: Int)-> Int {
        let val1 = input1 ?? 0
        let val2 = input2 ?? 0
        
        let answer = val1 - val2
        return answer
    }

//    @IBAction func getUserDashboard(_ sender: UIButton) {
//        
//        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
//        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
//        self.present(show,animated: true, completion: nil)
//    }
    
}

