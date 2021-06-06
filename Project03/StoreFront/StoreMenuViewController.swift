//
//  StoreMenuViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 6/4/21.
//

import UIKit

class StoreMenuViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func showCategoryView(category:String){
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "categoryList") as! CategoryViewController
        self.present(show,animated: true, completion: {category})
    }
    
    @IBAction func btnGym(_ sender: UIButton) {
        showCategoryView(category: "Gym")
    }
    
    @IBAction func btnGPU(_ sender: UIButton) {
        showCategoryView(category: "GPU")
    }
        
    @IBAction func btnCars(_ sender: UIButton) {
        showCategoryView(category: "Cars")
    }
    
    
    @IBAction func btnMetals(_ sender: UIButton) {
        showCategoryView(category: "Metals")
    }
    
    @IBAction func btnCleanSupplies(_ sender: UIButton) {
        showCategoryView(category: "Cleaning Supplies")
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(show,animated: true, completion: nil)
    }  
    
}
