//
//  MenuItemTableViewCell.swift
//  23_04_25_TableView_Demo_2
//
//  Created by Vishal Jagtap on 05/06/25.
//

import UIKit

class MenuItemTableViewCell: UITableViewCell {
    
    @IBOutlet var menuImageView: UIImageView!
    @IBOutlet var menuItemName: UILabel!
    @IBOutlet var menuItemPrice: UILabel!
    @IBOutlet var menuItemDescription: UILabel!
    @IBOutlet var btnMenuDetails: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        self.backgroundColor = selected ? .clear : .brown
    }
}
