//
//  ProductDetailViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/24/21.
//

import UIKit

class ProductDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var productName: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var desc: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var numOfItems: UILabel!
    @IBOutlet weak var priceLabel: UITextField!
    @IBOutlet weak var btnFavorites: UIButton!
    var isWishlist:Bool = false
    
    var prodViewModel : ProductViewModel?
    var cartViewModel : ShoppingCartViewModel?
    @IBOutlet weak var userLabel: UILabel!
    var userVM : UserViewModel?
    
    //SUGGESTED ITEMS SECTION
    @IBOutlet weak var suggestedItemsCollection: UICollectionView!
    var lstSuggItems = [ProductViewModel]()
    var suggestItemsError:String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        if prodViewModel != nil{
            desc.text = prodViewModel!.description
            productName.text = prodViewModel!.name
            img.image = UIImage(named: prodViewModel!.image)
            priceLabel.text = prodViewModel!.price

        }
        
        if let user = (parent as? StoreTabViewController)?.user {
            userVM = UserViewModel(user: user)
            userLabel.text = userVM?.greeting()
        }
        else{
            userLabel.text = "Welcome!"
        }
        // Suggested List Scroll Collection
        getSuggItemsLst()
    }


    @IBAction func subItem(_ sender: Any) {
        numOfItems.text = cartViewModel?.preSubItem()
    }
    @IBAction func addItem(_ sender: Any) {
        numOfItems.text = cartViewModel?.preAddItem()
    }
    @IBAction func addToCart(_ sender: Any) {
        cartViewModel?.addItemsToCart(product: prodViewModel!.getObj())
        NotificationCenter.default.post(name: .shoppingCartDidUpdate, object: nil)
    }


    @IBAction func getUserDashboard(_ sender: UIButton) {
        
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
    @IBAction func showStoreMenu(_ sender: UIButton) {
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnAddToWishlist(_ sender: Any) {
        let isFav:UIImage! = UIImage(systemName: "heart.fill")
        let notFav:UIImage! = UIImage(systemName: "heart")
        
        isWishlist.toggle()
        switch isWishlist{
        case true:
            btnFavorites.setBackgroundImage(isFav, for: UIControl.State.normal)
            // add to User.Wishlist CoreData
        case false:
            btnFavorites.setBackgroundImage(notFav, for: UIControl.State.normal)
            // remove to User.Wishlist CoreData
        }
    }
    //SUGGESTED ITEMS SECTION for UICOLLECTIONVIEW
    func getSuggItemsLst(){

            for product in DataHandler.inst.getSuggestedItemsList(){
                lstSuggItems.append(product)
            }
        if lstSuggItems.isEmpty == true{
            suggestItemsError = "Suggested Items did not load."
        } else {
            suggestItemsError = nil
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return lstSuggItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let aCell = suggestedItemsCollection.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! SuggItemsCollectionViewCell
        
        aCell.imgProduct.image = UIImage(named: lstSuggItems[indexPath.row].image)
        aCell.lblDesc.text = lstSuggItems[indexPath.row].name
        return aCell
    }    
    
}


