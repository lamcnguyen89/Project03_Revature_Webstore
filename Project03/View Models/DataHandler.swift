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
    //MARK: - PaymentOption Related
    func addACHOption(){

    }


    //MARK: - Product Related
    func fetchAllProducts() -> [Product]{
        let fetchReq = NSFetchRequest<Product>(entityName: "Product")
        let products = try! context?.fetch(fetchReq)
        return products!
    }

    func importCSV(){
        let queue = OperationQueue()
        let csvGroup = DispatchGroup()
        let fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "Product")

            csvGroup.enter()
            DispatchQueue.global().async{ [self] in
                //create a new background MOC based on main MOC for async thread
                let backgroundMOC: NSManagedObjectContext = {
                let moc = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
                moc.parent = context
                return moc
                }()
                let fetch = try! backgroundMOC.fetch(fetchReq)
                if fetch.count < 42{
                    //remove all artifacts before regenerating products
                    for item in fetch{
                        self.context?.delete(item)
                    }
                    let getCSV = AsyncCSV(context: backgroundMOC)
                    print("starting CSV import")
                    queue.addOperations([getCSV], waitUntilFinished: true)
                    csvGroup.leave()
                }
            }

            csvGroup.notify(queue: .global()) {
                sleep(1)
                print("CSV loading complete")
                NotificationCenter.default.post(name: .didCompleteCSV, object: nil)
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
            let ms = 1000
            usleep(useconds_t(25 * ms))
        }
        print(prodArray)
        try! context?.save()
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
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.email = object["email"]
        user.password = object["pass"]
        user.firstName = object["fname"]
        user.lastName = object["lname"]
        user.name = object["name"]
        do{
            try context?.save()
            print("Data Saved")
        }
        catch{
            print("data not saved")
        }
    }

    func updateUserName(_ name: String){
        //TODO
    }

    func getOneUser (name : String)-> User{
        var user = User()
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
            }
        }
        catch{
            print("No users found")
        }
        
        return user

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
}
