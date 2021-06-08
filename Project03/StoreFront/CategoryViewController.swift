//
//  CategoryViewController.swift
//  Purpose
//  Show a gallery of availble products where user
//  can scroll view gallery, add product to a wish list
//  ,add to a shopping cart, and click image to view
//   details about the product.

//  This view has two subviews:
//  ProductListViewController & ProductDetailViewController
//
//  Created by Lam Nguyen on 5/24/21.

import UIKit

class CategoryViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    private var pickerData = [String]()
    private var selection = 0
    var userVM : UserViewModel?
    private var pickerLabels = [String]()
    var currentCategory: String!


    @IBOutlet weak var userLabel: UILabel!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        categoryPicker.delegate = self
        categoryPicker.dataSource = self
        pickerLabels = ["Featured","Cleaning", "Metals", "GPUs","Exercise","Vehicles"]
        pickerData = ["Featured","Cleaning","Precious Metals","Graphics Cards","Exercise Equipment","Car"]
        if let user = (parent as? StoreTabViewController)?.user {
            userVM = UserViewModel(user: user)
            userLabel.text = userVM?.greeting()
        }
        else{
            userLabel.text = "Welcome!"
        }
        NotificationCenter.default.post(name: .didCompleteLoadingUI, object: nil)
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerLabels[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selection = row
        let hostingController = children.first { viewController in
            viewController is CategoryHostingController
        } as! CategoryHostingController

        hostingController.category = pickerData[selection]
        hostingController.reloadView()

    }
        
    @IBAction func showStoreMenu(_ sender: UIButton) {
        let sb = UIStoryboard(name: "StoreMenu", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "storeMenu")
        self.present(show, animated: true, completion: nil)
        
    }
    
    @IBAction func goToShoppingCart(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "shoppingCart")
        self.present(show, animated: true, completion: nil)
    }
    
    @IBAction func btnShowStoreMenu(_ sender: UIButton) {
        let sb = UIStoryboard(name: "StoreMenu", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier:  "storeMenu") as! StoreMenuViewController
        self.present(vc, animated: true, completion: nil)
    }
    
}

