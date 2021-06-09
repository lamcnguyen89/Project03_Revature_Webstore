//
//  MyOrdersHostingController.swift
//  Project03
//
//  Created by Lam Nguyen on 6/6/21.
//

import UIKit
import SwiftUI

class MyOrdersHostingController: UIHostingController<UserOrdersSwiftUI> {
    
    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: UserOrdersSwiftUI())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(ordersDidUpdate), name: .ordersDidUpdate, object: nil)
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
    @objc func ordersDidUpdate(){
        rootView = UserOrdersSwiftUI()
    }
}
