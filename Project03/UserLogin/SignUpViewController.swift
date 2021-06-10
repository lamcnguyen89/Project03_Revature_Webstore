//
//  SignUpViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/27/21.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Do any additional setup after loading the view.
    }
    

    @IBAction func submit(_ sender: Any) {
        
        
        if email.text != "" &&  username.text != "" && password.text != "" && confirmPassword.text != "" && firstName.text != "" && lastName.text != ""
            {
            
            if password.text == confirmPassword.text {
                
                let dic = ["email" : email.text , "pass" : password.text , "fname" : firstName.text, "lname" : lastName.text , "name" : username.text  ]
                
                DataHandler.inst.createUser(dic as! [String:String])
                
                email.text = ""
                username.text = ""
                firstName.text = ""
                lastName.text = ""
                password.text = ""
                confirmPassword.text = ""
                outputLabel.text = "New user created"
                
                // Go back to Login Page
                tabBarController?.selectedIndex = 2
                
            } else {
                print("Password fields do not match")
                outputLabel.text = "Password fields do not match"
                password.text = ""
                confirmPassword.text = ""
                
            }
    
        } else {
            print("Fill out all textfields")
            outputLabel.text = "Fill out all textfields"
        }
        

        
    }
    
    @IBAction func back(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        
    }
    @IBAction func createAccount(_ sender: Any) {
        let userData = ["name": username.text!, "email": email.text!, "password": password.text!, "firstName" : firstName.text!, "lastName" : lastName.text!]
        DataHandler().createUser(userData)
        self.dismiss(animated: true, completion: nil)
    }


    @IBAction func storeFront(_ sender: Any) {
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func goToUserDashboard(_ sender: Any) {
        let sb = UIStoryboard(name:"Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier: "userDash") as! UserDashboardViewController
        self.present(show,animated: true, completion: nil)
    }
    

}
