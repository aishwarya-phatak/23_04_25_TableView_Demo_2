//
//  ProductTableViewCell.swift
//  23_04_25_TableView_Demo_2
//
//  Created by Vishal Jagtap on 07/06/25.
//

import UIKit

class ProductTableViewCell: UITableViewCell {

    @IBOutlet var productIdLabel: UILabel!
    @IBOutlet var productNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
