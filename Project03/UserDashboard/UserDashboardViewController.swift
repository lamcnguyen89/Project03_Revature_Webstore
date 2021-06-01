//
//  UserDashboardViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/26/21.
//

import UIKit
import SwiftUI

class UserDashboardViewController: UIViewController {
    
    
   override func viewDidLoad() {
        super.viewDidLoad()
        //self.delegate = self
    }
    
    @IBSegueAction func showUserSaveItemsSwiftUI(_ coder: NSCoder) -> UIViewController? {
        
        let rootView = UserSaveItemsSwiftUIswift()
        
        return UIHostingController(coder: coder, rootView: rootView)
    }
    
    
    @IBSegueAction func showUserWishlistSwiftUI(_ coder: NSCoder) -> UIViewController? {
        
        let rootView = UserWishlistSwiftUI()
        
        return  UIHostingController(coder: coder, rootView: rootView)
    }
     
    
    
    @IBSegueAction func showUserOrdersSwiftUI(_ coder: NSCoder) -> UIViewController? {
        let rootView = UserOrdersSwiftUI()
        
        return UIHostingController(coder: coder, rootView: rootView)
    }
     
     
    @IBSegueAction func showUserAccountSettings(_ coder: NSCoder) -> UIViewController? {
        
        let rootView = UserAccountSettingsSwiftUI()
        
        return UIHostingController(coder: coder, rootView: rootView)
    }
    
}

    



