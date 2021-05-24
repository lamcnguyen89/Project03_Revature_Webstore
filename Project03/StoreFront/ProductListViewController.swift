//
//  ProductListViewController.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/23/21.
//

import UIKit

class ProductListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
    var sample = ["First Product", "Second Product", "Third Product", "Fourth Product"]

    @IBOutlet weak var tblGallery: UITableView!

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sample.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "product", for: indexPath) as! ProductDetailRowTableViewCell
       
        
        switch indexPath.section{
        case 0:
            cell.lblProductName.text = sample[indexPath.row]
            return cell
        default:
            return cell
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tblGallery.rowHeight = CGFloat(350.0)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
