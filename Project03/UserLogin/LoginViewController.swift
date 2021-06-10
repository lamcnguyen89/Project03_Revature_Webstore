//
//  LoginViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/27/21.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var displayOutput: UILabel!
    
    var answer: Int!
    var dataHandler = DataHandler()
    static var currentUser = User()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.


    }
    
    @IBAction func submitLogin(_ sender: Any) {


        if username.text! != "" || password.text! != ""  {
            do{
                let data = try dataHandler.getOneUser(name: username.text!)
                print(data.password)
                if data.password == password.text! {
                    displayOutput.text = "Login was successful"

                    print("Username: \(data.name!) \nPassword: \(data.password!)")
                    let appUser = LoginViewController.currentUser
                    



                    if appUser.name == "Guest" && appUser.shoppingCart != nil{
                        //store shopping cart data in incoming user
                        print(appUser)
                        data.shoppingCart = appUser.shoppingCart

                        LoginViewController.currentUser = data
                        LoginViewController.currentUser.shoppingCart?.user = LoginViewController.currentUser

                        //reset guest account
                        appUser.reset()
                    }

                    //set app user to incoming user

                    (parent as! StoreTabViewController).user = data

                    //update views
                    (parent as! StoreTabViewController).userDidUpdate()
                    
                    displayOutput.text = "Login was successful"
                    username.text = ""
                    password.text = ""
                    
                    // Go back to storefront
                    tabBarController?.selectedIndex = 0
                    
                }
            }
            catch{
                print("Wrong password or Username. Try again.")
                password.text = ""

                displayOutput.text = "Wrong password or Username"
            }
        } else {

            displayOutput.text = "Fill in all text fields"
            
        }
    }
    
   
    
    @IBAction func createAccount(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "CreateAccount") as! SignUpViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    @IBAction func resetPassword(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "ResetPassword") as! ResetPasswordViewController
        self.present(wel, animated: true, completion: nil)
    }

    @IBAction func logout(_ sender: Any) {
        let data = try! dataHandler.getOneUser(name: "Guest")
        LoginViewController.currentUser = data
        (parent as! StoreTabViewController).user = data
        (parent as! StoreTabViewController).userDidUpdate()
        displayOutput.text = "Logged out"
    }
    
    
    @IBAction func goToStorefront(_ sender: Any) {
        tabBarController?.selectedIndex = 0
    }
    
    @IBAction func goToDashboard(_ sender: Any) {
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    
}

