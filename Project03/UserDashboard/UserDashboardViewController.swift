//
//  UserDashboardViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/3/21.
//

import UIKit
import SwiftUI


class UserDashboardViewController: UIViewController {
    
    private var currentUser:User!
    private var getCurrentUser:UserViewModel!
    //UserViewModel(user:DataHandler.inst.getGuestUser())
    
    @IBOutlet weak var lblWelcome: UILabel!
    @IBOutlet weak var btnOrders: UIButton!
    @IBOutlet weak var viewOrders: UIView!
    @IBOutlet weak var btnAccountSet: UIButton!
    @IBOutlet weak var viewAccount: UIView!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        if let appUser = (parent as? StoreTabViewController)?.user {
            print(appUser.name)
            currentUser = appUser
            getCurrentUser = UserViewModel(user: currentUser)
            if currentUser.name == "Guest"{
                btnLogin.isHidden = false
                btnAccountSet.isHidden = true
                btnOrders.isHidden = true
            } else {
                btnLogin.isHidden = true
                btnAccountSet.isHidden = false
                btnOrders.isHidden = false
            }
            lblWelcome.text = "Welcome \(appUser.name)"
        } else {
            getCurrentUser = UserViewModel(user:DataHandler.inst.getGuestUser())
            lblWelcome.text = "Welcome \(getCurrentUser.name)"
            btnLogin.isHidden = false
            viewAccount.backgroundColor = .blue
            btnAccountSet.isEnabled = false
            viewOrders.backgroundColor = .blue
            btnOrders.isEnabled = false
       }
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
    }
    
    @IBAction func btnStoreMenu(_ sender: UIButton) {
        let sb = UIStoryboard.init(name: "StoreMenu", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "storeMenu") as! StoreMenuViewController
        self.present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func btnContinueShopping(_ sender: UIButton) {
        
        let sb = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "categoryList") as! CategoryViewController
        
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
