//
//  AccountSettingsHostingController.swift
//  Project03
//
//  Created by Lam Nguyen on 6/6/21.
//

import UIKit
import SwiftUI

class AccountSettingsHostingController: UIHostingController<UserAccountSettingsSwiftUI> {

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: UserAccountSettingsSwiftUI())
    }

    override func viewDidLoad() {
        super.viewDidLoad()

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
