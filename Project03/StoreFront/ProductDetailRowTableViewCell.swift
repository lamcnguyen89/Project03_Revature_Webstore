//
//  ProductDetailRowTableViewCell.swift
//  Project03
//
//  Created by Lea W. Leonard on 5/23/21.
//

import UIKit

class ProductDetailRowTableViewCell: UITableViewCell {

    @IBOutlet weak var imgProduct: UIImageView!
    @IBOutlet weak var lblProductName: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var starRate: UILabel!
    @IBOutlet weak var btnPlus: UIButton!    
    @IBOutlet weak var btnHeart: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
