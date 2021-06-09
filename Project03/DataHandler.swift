//
//  DataDelegate.swift
//  Project03
//
//  Created by Kirtland Ross on 5/24/21.
//

import Foundation
import CoreData
import UIKit
import SwiftCSV

class DataHandler {

    let context : NSManagedObjectContext?
    static var inst = DataHandler()

    init (context: NSManagedObjectContext) {
        self.context = context
    }
    init(){
        context = ((UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext)!
    }

    //MARK: - Shopping Cart Related
    func getShoppingCart(){

    }

    //MARK: - PaymentOption Related
    func submitPayment(_ ccVC: CreditCardViewController){
        let user = LoginViewController.currentUser
        let cc = CreditCard(context: context!)

        cc.nameOnCard = ccVC.name.text!
        cc.street = ccVC.address.text!
        cc.city = ccVC.city.text!
        cc.state = ccVC.state.text!
        cc.zip = Int64(ccVC.zip.text!)!
        cc.number = Int64(ccVC.creditNumber.text!)!
        cc.expDate = String(ccVC.expMonth.text! + "," + ccVC.expYear.text!)

        user.paymentOptions?.addToPaymentOptions(cc)
        try! context?.save()
    }

    func submitPayment(_ dictionary : [String: String]){
        let user = LoginViewController.currentUser
        let ach = ACH(context: context!)
        ach.acctNumber = Int64(dictionary["acctNumber"]!)!
        ach.nameOnAccount = dictionary["nameOnAccount"]
        ach.routingNumber = Int64(dictionary["routingNumber"]!)!

        user.paymentOptions?.addToPaymentOptions(ach)

    }
    //MARK: - Store Related
    func fetchStore() -> Store{
        let fetchReq = NSFetchRequest<Store>(entityName: "Store")
        return try! (context!.fetch(fetchReq).first!)
    }
    //MARK: - Category Related
    func fetchAllCategories() -> [Category]{
        let store = fetchStore()
        return store.categories?.array as! [Category]
    }


    //MARK: - Product Related
    func fetchAllProducts() -> [Product]{
        var products = [Product]()
        let categories = fetchAllCategories()
        for item in categories{
            products.append(contentsOf: item.products?.array as! [Product])
        }
        return products
    }
    
    func getProductName() -> [String]{
        let prods: [Product] = fetchAllProducts()
        var prodsName = [String]()
        for p in prods {
            prodsName.append(p.name!)
        }
        return prodsName
    }

    //MARK: - CSV Parse
    func importProducts(){

        let queue = OperationQueue()
        let prodCSVGroup = DispatchGroup()
        let prodFetchReq = NSFetchRequest<Product>.init(entityName: "Product")

        prodCSVGroup.enter()
        DispatchQueue.global().async{ [self] in

            //create a new background MOC based on main MOC for async thread
            let prodBackgroundMOC: NSManagedObjectContext = {
                let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                moc.parent = context
                return moc
            }()
            let fetch = try! prodBackgroundMOC.fetch(prodFetchReq)
            if fetch.count < 42 {
                //remove all artifacts before regenerating products
                for item in fetch{
                    self.context?.delete(item)
                }
                //using operations and operation queue allows for KVO compliant threads
                //in this current build KVO compliance isn't necessary, but does allow for expandibility in the future
                let getCSV = AsyncCSV(context: prodBackgroundMOC)
                print("starting Product import")
                queue.addOperations([getCSV], waitUntilFinished: true)
            }
            prodCSVGroup.leave()
        }

        prodCSVGroup.notify(queue: .global()) {
            //                sleep(1)
            print("product loading complete")
            NotificationCenter.default.post(name: .didCompleteProductImport, object: nil)
        }
    }
    func generateInitialProducts(){
        var prodArray = [Product]()
        var csv : CSV?
        let url =  Bundle.main.url(forResource: "ProductDataCSV", withExtension: "csv")!
        let resource = try! CSV(url: url)
        csv = resource


        for item in csv!.namedRows{
            let prod = Product(context: context!)
            prod.update(dictionary: item, store: getStore())
            prodArray.append(prod)
            print(item)
            //            let ms = 1000
            //            usleep(useconds_t(25 * ms))
        }
        print(prodArray)
        try! context!.save()
    }

    func importUsers(){
        let userFetchReq = NSFetchRequest<User>.init(entityName: "User")
        let userCSVGroup = DispatchGroup()

        userCSVGroup.enter()
        DispatchQueue.global().async{ [self] in
            let userBackgroundMOC: NSManagedObjectContext = {
                let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                moc.parent = context
                return moc
            }()
            let fetch = try! userBackgroundMOC.fetch(userFetchReq)
            if fetch.count < 5 {
                //remove all artifacts before regenerating products
                for item in fetch{
                    self.context?.delete(item)
                }
                print("starting user import")
                generateInitialUsers()
            }
            userCSVGroup.leave()
        }

        userCSVGroup.notify(queue: .global()) {
            print("user loading complete")
            NotificationCenter.default.post(name: .didCompleteUserImport, object: nil)
        }
    }
    //MARK: - Fetch Products Related
    func fetchAllProducts() -> [String: [Product]]{

        var featuredProducts = [Product]()
        var dictionary = [String: [Product]]()
        let categories = fetchAllCategories()
        for category in categories{
            var products = [Product]()
            for item in category.products?.array as! [Product]{
                products.append(item)
                if item.isFeatured{
                    featuredProducts.append(item)
                }
            }
            dictionary[category.name!] = products
        }
        dictionary["Featured"] = featuredProducts
        print(dictionary)
        return dictionary
    }

    func fetchFeaturedProducts() -> [Product]{
        var products = [Product]()
        let categories = fetchAllCategories()
        for category in categories{
            for item in category.products?.array as! [Product]{
                if item.isFeatured{
                    products.append(item)
                }
            }
        }
        return products
    }
    
    //MARK: - Product Rating Related
    func getProductRating() {
        
        
        
    }


    //MARK: - Order Related
    func placeOrder(items: [ProductViewModel], to address : Address, withPayOption paymentOption: PaymentType){
        var products = [Product]()
        for item in items{
            products.append(item.getObj())
        }
        let user = address.user
        let order = Order(context: user!.managedObjectContext!)
        order.addToProduct(NSOrderedSet(array: products))
        order.address = address
        order.payment = paymentOption
    }

    //MARK: - Payment Related
    func getCreditCards(user : User) throws -> PaymentTypeViewModel{
        let fetchReq = NSFetchRequest<CreditCard>(entityName: "CreditCard")
        var ccArr = [CreditCard]()
        do{
            let results = try context?.fetch(fetchReq)
            if  results!.count == 0{
                print("no credit cards on record")
                return PaymentTypeViewModel(payment: results!)
            }
            for item in results!{
                if item.user?.name == user.name{
                    ccArr.append(item)
                }
            }
        }
        catch{
            print("no credit cards found")
            throw FetchError.BadFetchRequest
        }
        return PaymentTypeViewModel(payment: ccArr)
    }

    //MARK: - Address Related
    func getAddresses(user : User) throws -> [AddressViewModel]{
        let fetchReq = NSFetchRequest<Address>(entityName: "Address")
        var addArr = [AddressViewModel]()
        do{
            let results = try context?.fetch(fetchReq)
            if  results!.count == 0{
                print("no addresses on record")
                return addArr
            }
            for item in results!{
                if item.user?.name == user.name{
                    addArr.append(AddressViewModel(address: item))
                }
            }
        }
        catch{
            print("no addresses found")
            throw FetchError.BadFetchRequest
        }
        return addArr
    }


    //MARK: - User Related
    func createUser(_ object: [String:String]){
        let user = User(context: context!)
        user.email = object["email"]
        user.password = object["password"]
        user.firstName = object["firstName"]
        user.lastName = object["lastName"]
        user.name = object["name"]
        do{
            try context?.save()
            print("Data Saved")
        }
        catch{
            print("data not saved")
        }
    }
    func generateInitialUsers(){
        var userArray = [User]()
        var csv : CSV?
        let url =  Bundle.main.url(forResource: "User_Data", withExtension: "csv")!
        let resource = try! CSV(url: url)
        csv = resource
        for item in csv!.namedRows{
            let user = User(context: context!)
            user.update(dictionary: item)
            userArray.append(user)
            print(item)
        }
        print(userArray)
        try! context?.save()
    }

    func updateUserName(_ name: String){
        //TODO
    }
  /*
    //:User Orders
    func demoGetUserOrders(user: User) ->[String: [Order]]{
       // let fetchHistory = NSFetchRequest<NSFetchRequestResult>(entityName: "OrderHistory")
        let fetchOrders = NSFetchRequest<NSFetchRequestResult>(entityName: "Order")
        var lstOrders = [String: [Order]]()

       // let userOrders = try? (self.context?.fetch(fetchHistory) as! [OrderHistory])
        let userOrders = try? (self.context?.fetch(fetchOrders) as! [Order])
            if userOrders?.isEmpty == true{
                print("no orders")
                return lstOrders
            } else {
                /*
                for o in userOrders!{
                    if o.user!.name == user.name {
                            lstOrders.updateValue(String(o.date), forKey: user)
                            lstOrders.updateValue(String(o.payment), forKey: user)
                            lstOrders.updateValue(String(o.address), forKey: user)
                            lstOrders.updateValue(String(o.price), forKey: user)
                   
                    }*/
                }
            }
        return lstOrders
    }
 */
    
    func getSuggestedItemsList()->[ProductViewModel]{
        var suggProdList = [ProductViewModel] ()
        let productList:[Product] = fetchAllProducts().shuffled()
        for i in 0..<10{
            suggProdList.append(ProductViewModel(product: productList[i]))
        }
        return suggProdList
    }

    func getWishlist(user: User) -> [String: [ProductViewModel]] {
            let fetchList = NSFetchRequest<NSFetchRequestResult>(entityName: "Wishlist")
            var wishList: NSOrderedSet
            var list = [ProductViewModel]()
            var userWishList = [String: [ProductViewModel]] ()
            var suggestList = [String: [ProductViewModel]] ()
            do{
                let results = try self.context?.fetch(fetchList) as! [Wishlist]
                if results.isEmpty == true{
                    print("no items in wishlist")
                    let newList = fetchFeaturedProducts().shuffled()
                   
                    for i in 0..<5{
                        list.append(ProductViewModel(product: newList[i]))
                    }
                    suggestList["Suggested Items"] = list
                    return suggestList
                }
                for i in results{
                    if i.user?.name == user.name{
                        wishList = NSOrderedSet(orderedSet: i.products!)
                        for p in wishList.objectEnumerator(){
                            list.append(ProductViewModel(product: p as! Product))
                        }
                        break
                    }
                }
                // and to dic: userWishList -> return dic
                userWishList[user.name ?? "Guest"] = list
                return userWishList
            }catch{
                print("Wishlist is empty")
            }
            return userWishList
        }
    
        
    /*
    func addData(object : [String:String]){
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.username = object["username"]
        user.password = object["password"]
        user.score = 0.0
        user.qtaken = 0
        user.taken = false
        do{
            try context?.save()
            print("Data Save")
            print("", user.username)
            print("",user.password)
        }
        catch{
            print("data not saved")
        }
    }
 */
    
    func getOneUser (name : String)throws -> User{
        var user : User
        let fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [User]
            if(req.count != 0 ){
                user = req.first!
            }
            else{
                print("No users found")
                throw FetchError.NoUsersFound
            }
        }
        catch{
            print("Bad Fetch")
            throw FetchError.BadFetchRequest
        }
        print(user)
        print(user.password!)
        return user

    }
    func getGuestUser() -> User{
        let name = "Guest"
        let fetchReq = NSFetchRequest<User>(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "name == %@", name)
        return try! (context?.fetch(fetchReq).first)!
    }

    func updatePassword(_ object: [String: String]){
        var user = User()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format: "name == %@", object["name"]!)
        do{
            let req = try context?.fetch(fetchReq)

            if (req?.count != 0 ){
                user = req!.first as! User
                user.password = object["password"]
            }
        }
        catch{

        }
    }
    func getStore() -> Store{
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Store")
        var store : Store?
        do{
            let req = try context?.fetch(fetchReq)
            if (req?.first != nil ){
                store = req!.first as? Store
            }
            else{
                store = Store(context: context!)
            }
        }
        catch{
            print("DataDelegate.createStore fetch error")
        }
        return store!
    }
}

enum FetchError : Error{
    case BadFetchRequest
    case NoUsersFound
}

extension Notification.Name {

    static let didCompleteProductImport = Notification.Name("didCompleteProductImport")
    static let didCompleteUserImport = Notification.Name("didCompleteUserImport")
    static let didCompleteLoadingUI = Notification.Name("didCompleteLoadingUI")
    static let shoppingCartDidUpdate = Notification.Name("shoppingCartDidUpdate")
    static let didGetUser = Notification.Name("didGetUser")
    static let checkout = Notification.Name("checkout")

 
}
