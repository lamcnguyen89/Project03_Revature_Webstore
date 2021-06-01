//
//  MyAccountViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/26/21.
//

import UIKit

class MyAccountViewController: UIViewController {

    var currentUser = [String:String]() // not sure working
    var fName:String? // User.firstName
    var lName:String? // User.lastName
    var email:String? // User.email
    var pword:String? // User.password
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getCurrentUser(){
        // retrive record of current user from label field
        /*currentUser = DataDelegate.inst.getOneUser(name:"")*/
        
    }

    func updateUserName(){
        // get user firstname and last name from txtField
        // update User.firstName & User.lastName
        
    }
    
    func updateUserEmail(){
        // get user email from txtField
        // upadate User.email
    }
    
    func updatePassword(){
        // first check if current password is correct
        // update User.password
    }
    

}
