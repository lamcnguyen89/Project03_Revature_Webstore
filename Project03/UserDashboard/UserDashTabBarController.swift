//
//  UserDashTabBarController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/27/21.
//

import UIKit

class UserDashTabBarController: UITabBarController {
   
    static var tc = UserDashTabBarController()

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func showTabs(){
        print("Show tabs")
             
        /*
        let sb = UIStoryboard(name:"UserDashboard", bundle: nil)
        let vc =  sb.instantiateViewController(withIdentifier:"wishList") as! WishListViewController
        let tabVC = tabs.selectedViewController as! WishListViewController
        
        tabVC.pushViewController(vc, animated: true)
     */
        
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


