//
//  UserDashboardViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/26/21.
//

import UIKit

class UserDashboardViewController: UIViewController {
   
    let tabs = UserTabNavViewController()
    let vcWish = WishListViewController()
    let vcOrders = OrdersViewController()
    @IBOutlet weak var btnWish: UIButton!
    @IBOutlet weak var btnOrder: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabs.viewControllers = [vcWish, vcOrders]

    }
    
   
       
    @IBAction func btnSaveIItems(_ sender: UIButton) {
        
    }
    
    @IBAction func btnWishList(_ sender: UIButton) {
        //tabs.tabBarController(tabs, didSelect: vcWish)
        
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you wll often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */



