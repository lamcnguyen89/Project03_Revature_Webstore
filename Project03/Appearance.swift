
//  Appearance.swift
//  Project_3
//
//  Created by Lam Nguyen on 5/12/21.
//

// This file contains standardized appearances for objects
import Foundation
import UIKit

// Class to standardize Main View Objects
class MyBackground1 : UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
      //  self.backgroundColor = UIColor(red: 255/255 , green: 255/255 ,blue: 255/255 , alpha: 1.0)
    }
}



// Class to standardize Main View Objects
class MyMainView : UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // MyMainView.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        self.backgroundColor = .white
        self.layer.borderColor = UIColor.black.cgColor
        //self.layer.borderWidth = 2.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.70).cgColor
        self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 8
        
    }
    
}

// Class to standardize Main View Objects
class MySubView : UIView {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // MyMainView.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
      //  self.backgroundColor = .white
       // self.layer.borderColor = UIColor.black.cgColor
        //self.layer.borderWidth = 2.0
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.70).cgColor
        self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        self.layer.cornerRadius = 10
        
    }
    
}

// Class to standardize Primary Button Objects
class MyButtons : UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // MyButtons.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        self.backgroundColor = UIColor.systemOrange
        MyButtons.appearance().contentEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        // MyButtons.appearance().tintColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        MyButtons.appearance().tintColor = .white
       //self.layer.borderWidth = 3.0
        //self.layer.borderColor = UIColor.black.cgColor
       self.layer.cornerRadius = 16
       // self.layer.masksToBounds = false
       // self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.70).cgColor
        self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2
        
    
    }
}

// Back Button Styling
class MyButtons2 : UIButton {
    
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // MyButtons.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
       // self.backgroundColor = UIColor.systemOrange
        MyButtons.appearance().contentEdgeInsets = UIEdgeInsets(top: 2, left: 10, bottom: 2, right: 10)
        // MyButtons.appearance().tintColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        MyButtons.appearance().tintColor = .white
       //self.layer.borderWidth = 3.0
        //self.layer.borderColor = UIColor.black.cgColor
       self.layer.cornerRadius = 8
       // self.layer.masksToBounds = false
       // self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
        self.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.center
       // self.layer.shadowColor = UIColor.black.withAlphaComponent(0.70).cgColor
        //self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        //self.layer.shadowOpacity = 1
        //self.layer.shadowRadius = 2
        
    
    }
}


class LoginButtons:MyButtons{
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        super.backgroundColor = UIColor(red: 30/255, green: 144/255, blue: 255/255, alpha: 1)
        
    }
}

// Class to standardize heading labels
class MyHeadingLabels: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        //MyQuestionLabels.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        self.textColor = UIColor(red: 0/255, green: 195/255, blue: 255/255, alpha: 1)
        //self.layer.borderWidth = 2.0
       // self.backgroundColor = .white
        //self.layer.borderColor = UIColor.black.cgColor
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 40.0, weight: .semibold)
        self.minimumScaleFactor = 0.5
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        self.layer.cornerRadius = 8
        
    }}

// Class to standardize subheading labels
class MySubHeadingLabels: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        //MyQuestionLabels.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
      //  self.textColor = UIColor.black
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.minimumScaleFactor = 0.5
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
    }}

// Class to standardize subheading labels that require multiple lines
class MyLongFormLabels: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        //MyQuestionLabels.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
       // self.textColor = UIColor.black
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.minimumScaleFactor = 0.5
        
        self.adjustsFontSizeToFitWidth = true
        
    }}

// Class to standardize subheading labels
class MyQuestionLabels: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        //MyQuestionLabels.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
       // self.textColor = UIColor.black
        self.textAlignment = .center
        self.font = UIFont.boldSystemFont(ofSize: 20.0)
        self.numberOfLines = 0
        self.lineBreakMode = NSLineBreakMode.byWordWrapping
        self.backgroundColor = UIColor.white
        self.layer.cornerRadius = 20
        self.layer.masksToBounds = true
        self.minimumScaleFactor = 0.5
        self.numberOfLines = 0
        self.adjustsFontSizeToFitWidth = true
        
    }}


// Class to style text fields
class MyTextFields : UITextField {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        // textFieldPlaceholder()
        self.attributedPlaceholder = NSAttributedString(string: self.placeholder != nil ? self.placeholder! : "placeholder", attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray, NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25)
        ])
        self.textAlignment = .center
        self.font = UIFont.systemFont(ofSize: 25)
        //Basic texfield Setup
         self.borderStyle = .roundedRect
          self.backgroundColor = UIColor.white // Use anycolor that give you a 2d look.

          //To apply corner radius
           // self.layer.cornerRadius = 8

          //To apply border
         // self.layer.borderWidth = 3
         // self.layer.borderColor = UIColor.black.cgColor

          //To apply Shadow
          self.layer.shadowOpacity = 1
          self.layer.shadowRadius = 2.0
          self.layer.shadowColor = UIColor.gray.cgColor
          self.layer.borderColor = UIColor.black.withAlphaComponent(0.25).cgColor
          self.layer.shadowOffset = CGSize(width: 4, height: 4)
          self.layer.shadowColor = UIColor.black.withAlphaComponent(0.70).cgColor //Any dark color
          self.adjustsFontSizeToFitWidth = true
        self.layer.cornerRadius = 8
        
    }}

// Class to standardize labels that contain the questions
class MySwitch : UISwitch {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        //MyQuestionLabels.appearance().backgroundColor = UIColor(red: 85/255 , green: 150/255 ,blue: 100/255 , alpha: 1.0)
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        self.layer.shadowOffset = CGSize(width: 4.0, height: 4.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 3
        
    }
}

// Class to standardize labels that contain the questions
class MyPickerView : UIPickerView {
    required init?(coder: NSCoder) {
        super.init(coder : coder)
        self.backgroundColor = UIColor.white
        //self.layer.borderWidth = 3.0
       // self.backgroundColor = .white
       // self.layer.borderColor = UIColor.black.cgColor
        self.layer.shadowColor = UIColor.black.withAlphaComponent(0.75).cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 0
        self.layer.cornerRadius = 8
        
    }
}
