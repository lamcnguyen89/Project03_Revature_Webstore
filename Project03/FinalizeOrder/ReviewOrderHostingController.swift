//
//  ReviewOrderHostingController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/29/21.
//

import UIKit
import SwiftUI

class ReviewOrderHostingController: UIHostingController<ReviewOrderScrollView> {

    required init?(coder aDecoder: NSCoder){
        super.init(coder: aDecoder, rootView: ReviewOrderScrollView())
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    
}
