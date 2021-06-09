//
//  StoreMenuViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/4/21.
//

import UIKit

class StoreMenuViewController: UIViewController {
    
    let store = CategoryViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showCategoryView(category:String){
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let vc = sb.instantiateViewController(withIdentifier: "categoryList") as! CategoryViewController
        self.present(vc, animated: false, completion: {vc.currentCategory = category})
    }
    
    @IBAction func btnGym(_ sender: UIButton) {
        showCategoryView(category: "Exercise Equipment")
    }
    
    @IBAction func btnGPU(_ sender: UIButton) {
        showCategoryView(category: "Graphics Card")
    }
        
    @IBAction func btnCars(_ sender: UIButton) {
        showCategoryView(category: "Car")
    }
    
    
    @IBAction func btnMetals(_ sender: UIButton) {
        showCategoryView(category: "Precious Metals")
    }
    
    @IBAction func btnCleanSupplies(_ sender: UIButton) {
        showCategoryView(category: "Cleaning")
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(show,animated: true, completion: nil)
    }  
    
}
