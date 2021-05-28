//
//  UserDashboardViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/26/21.
//

import UIKit

class UserDashboardViewController: UIViewController, UITabBarControllerDelegate {
    
    
    @IBOutlet weak var btnSaveItems: UIButton!
    @IBOutlet weak var btnWishList: UIButton!
    @IBOutlet weak var btnOrders: UIButton!
    @IBOutlet weak var btnAccount: UIButton!
    
    let vcSaveItems = SaveItemsViewController()
    let vcWishList = WishListViewController()
    
    //let _item00 = UITabBarItem()
    //let _item01 = UITabBarItem()
       
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //vcSaveItems.tabBarItem = _item00
        //vcWishList.tabBarItem = _item01
              
           
    }
    
    // tabBarController delegate
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print("Select a custom tab bar item")
    }
    
          
    @IBAction func btnSaveIItems(_ sender: UIButton) {
        
    }
    
    @IBAction func btnWishList(_ sender: UIButton) {
        print("going to start show tabs")
        //UserDashTabBarController.tc.showTabs()
        
    }
    
    @IBAction func getCategoryLIst(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "categoryList") as! CategoryViewController
        self.present(show,animated: true, completion: nil)
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



