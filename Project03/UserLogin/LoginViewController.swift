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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
    }
    
    @IBAction func submitLogin(_ sender: Any) {


        if( username.text! != "" && password.text! != "" ) {
            
            let data = DataHandler.inst.getOneUser(name: username.text!)
            
            if data.password == password.text! {
                displayOutput.text = "Login was successful"
                
                print("Username: \(data.name!) \nPassword: \(data.password!)")
                
                username.text = ""
                password.text = ""
               // let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
               // let wel = sb.instantiateViewController(withIdentifier: "Welcome") as! WelcomeViewController
                
                // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
                // This shows the screen once you log on.
              //  self.present(wel, animated: true, completion: nil)
            } else {
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
    
}
