//
//  UserDashboardViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/3/21.
//

import UIKit
import SwiftUI


class UserDashboardViewController: UIViewController {
    
    //var category:String = "Feature"
    private var getCurrentUser:User?
    @IBOutlet weak var lblWelcome: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblWelcome.text = "Hello  \(getCurrentUser)!"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: #selector(didCompleteUserImport(_:)), name: .didCompleteUserImport, object: nil)
    }
    
    @objc func didCompleteUserImport(_ notif: Notification){
        self.getCurrentUser = DataHandler.inst.getGuestUser()
    }
    
    @IBAction func btnStoreMenu(_ sender: UIButton) {
        let sb = UIStoryboard.init(name: "StoreMenu", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "storeMenu") as! StoreMenuViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btnContinueShopping(_ sender: UIButton) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "categoryList")
        
        self.present(vc, animated: true, completion: nil)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(vc, animated: true, completion: nil)
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
