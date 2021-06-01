//
//  ResetPasswordViewController.swift
//  Project03
//
//  Created by Lam Nguyen on 5/27/21.
//

import UIKit

class ResetPasswordViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var outputLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(wel, animated: true, completion: nil)
    }
    
    
    @IBAction func submit(_ sender: Any) {
        
        if email.text! != "" &&
            username.text! != "" &&
            password.text! != "" &&
            confirmPassword.text! != "" &&
            firstName.text! != "" &&
            lastName.text! != "" {
            
            if password.text == confirmPassword.text {
                
                let data = DataDelegate.inst.getOneUser(name: username.text!)
                print(data.name!)
                
                if data.name != nil &&
                    data.email == email.text &&
                    data.firstName == firstName.text &&
                    data.lastName == lastName.text {
                    
                    let dic = ["name" : username.text, "password" : password.text]
                    
                    DataDelegate.inst.updatePassword(dic as! [String:String])
                    
                    outputLabel.text = "Password updated successfully"
                    email.text = ""
                    username.text = ""
                    firstName.text = ""
                    lastName.text = ""
                    password.text = ""
                    confirmPassword.text = ""
                    
                    /*
                    let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let wel = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
                    self.present(wel, animated: true, completion: nil)
                    */
                    
                } else {
                    print(" The user information you have entered is not found in the database")
                    outputLabel.text = " The user information you have entered is not found in the database"
                }
 
 

                
            } else {
                print("The Password fields do not match")
                password.text = ""
                confirmPassword.text = ""
            }
        } else {
            print("Input all information in the text fields")
            outputLabel.text = "Input all information in the text fields"
        }
        
    }
    
    
}
