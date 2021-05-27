//
//  ViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/21/21.
//

import UIKit

class ViewController: UIViewController {
    
    var answer: Int!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    func adder(input1: Int!, input2: Int!)-> Int {
        
        let val1 = input1 ?? 0
        let val2 = input2 ?? 0
        
        let answer = val1 + val2
        
        return answer
    }
    
/*
    @IBAction func getStore(_ sender: Any) {
        
        let initialView = UIStoryboard(name: "StoreBoard", bundle: nil)
        
        // create connection to the view controller you want to show from
        // initial StoryBoard.View
        let StoreView = initialView.instantiateViewController(withIdentifier: "vwStore") as! StoreViewController
        
        self.present(StoreView, animated: true, completion: nil)
    }
 */
    
}

