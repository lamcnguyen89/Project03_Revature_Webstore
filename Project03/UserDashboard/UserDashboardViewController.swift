//
//  UserDashboardViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/26/21.
//

import UIKit

class UserDashboardViewController: UIViewController {
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
   
       
    @IBAction func btnSaveIItems(_ sender: UIButton) {
        
    }
    
    @IBAction func btnWishList(_ sender: UIButton) {
        //tabs.tabBarController(tabs, didSelect: vcWish)
        
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



