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
        NotificationCenter.default.addObserver(self, selector: #selector(reviewOrderDidUpdate), name: .reviewOrderDidUpdate, object: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      
    }
    @objc func reviewOrderDidUpdate(){
        rootView = ReviewOrderScrollView()
      }

    
}
