//
//  MenuItemDetailsViewController.swift
//  23_04_25_TableView_Demo_2
//
//  Created by Vishal Jagtap on 05/06/25.
//

import UIKit

class MenuItemDetailsViewController: UIViewController {

    var container : MenuItem?
    
    @IBOutlet var menuItemNameLabel: UILabel!
    @IBOutlet var menuItemPriceLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindData()
    }
    
    func bindData(){
        
        menuItemNameLabel.text = container?.menuItemName
        menuItemPriceLabel.text = "\(container?.menuItemPrice ?? 0.0)"
    }
}
