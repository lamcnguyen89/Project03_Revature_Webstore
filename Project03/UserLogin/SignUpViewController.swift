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
                
                let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                
                // This instantiates or shows the storyboard object/view controller that you want to show once you log in.
                let log = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
                
                // Function which belongs to UIviewController. If this isn't called, the next screen will not show up.
                // This shows the screen once you log on.
                self.present(log, animated: true, completion: nil)
                
                email.text = ""
                username.text = ""
                firstName.text = ""
                lastName.text = ""
                password.text = ""
                confirmPassword.text = ""
                outputLabel.text = ""
                
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
        let sb : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let wel = sb.instantiateViewController(withIdentifier: "Login") as! LoginViewController
        self.present(wel, animated: true, completion: nil)
        
    }
    
    @IBAction func storeFront(_ sender: Any) {
        let sb = UIStoryboard(name: "Main", bundle:nil)
        let show = sb.instantiateViewController(withIdentifier:  "categoryList")
        self.present(show, animated: true, completion: nil)
    }
    

}
