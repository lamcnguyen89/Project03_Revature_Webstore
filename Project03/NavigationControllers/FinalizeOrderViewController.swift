//
//  FinalizeOrderViewController.swift
//  Project03
//
//  Created by Kirtland Ross on 6/9/21.
//

import UIKit

class FinalizeOrderViewController: UITabBarController {
    var shoppingCartVM : ShoppingCartViewModel?
    var user : User
    init?(coder: NSCoder, user : User){
        self.user = user
        super.init(coder: coder)
        print(user)
    }

    required init?(coder: NSCoder) {
        fatalError("You must initialize FinalizeOrderViewController with a user")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        print(user)
        // Do any additional setup after loading the view.
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
