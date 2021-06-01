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
    //MARK: -- Payment Related
    func getCreditCards(user : User) throws -> PaymentOptionsViewModel{
        let fetchReq = NSFetchRequest<CreditCard>(entityName: "CreditCard")
        var ccArr = [CreditCard]()
        do{
            let results = try context?.fetch(fetchReq)
            if  results!.count == 0{
                print("no credit cards on record")
                return PaymentOptionsViewModel(payment: results!)
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
        return PaymentOptionsViewModel(payment: ccArr)
    }
    //MARK: -- User Related
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
        }
        print(prodArray)
        try! context?.save()
    }
}

enum FetchError : Error{
    case BadFetchRequest 
}
