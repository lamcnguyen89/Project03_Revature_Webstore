//
//  UserTabNavViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/26/21.
//

import UIKit

class UserTabNavViewController: UITabBarController {
    
    let vcSaveItems = SaveItemsViewController()
    let vcWishList = WishListViewController()
    let vcOrders = OrdersViewController()
    let vcAccount = MyAccountViewController()
    let tabs = UserTabNavViewController()
    
    var getTab:Int = 0    
    
    
   // static var tc = UserTabNavViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
