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
    var user : UserViewModel?

    @IBOutlet weak var userLabel: UILabel!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        if user == nil{
            userLabel.text = "Welcome!"
        }
        else{
            userLabel.text = user?.greeting()
        }
        NotificationCenter.default.post(name: .didCompleteLoadingUI, object: nil)
    }

//    @IBAction func getUserDashboard(_ sender: UIButton) {
//
//        let sb = UIStoryboard(name:"UserDashboard", bundle:nil)
//        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
//        self.present(show,animated: true, completion: nil)
//    }
    
}

