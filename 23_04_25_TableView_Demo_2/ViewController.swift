//
//  ViewController.swift
//  23_04_25_TableView_Demo_2
//
//  Created by Vishal Jagtap on 05/06/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var menuItemsTableView: UITableView!
    var reuseIdentiferForMenuItemTableViewCell = "MenuItemTableViewCell"
    var reuseIdentifierForMenuItemTableViewController = "MenuItemDetailsViewController"
    
    var menuItems : [MenuItem] = [
        MenuItem(menuItemName: "VadaPav", menuItemPrice: 30.0, menuItemDescription: "Tasty"),
        MenuItem(menuItemName: "Pohe", menuItemPrice: 30.0, menuItemDescription: "Breakfast"),
        MenuItem(menuItemName: "Samosa", menuItemPrice: 30.0, menuItemDescription: "Crispy"),
        MenuItem(menuItemName: "Upma", menuItemPrice: 30.0, menuItemDescription: "Breakfast"),
        MenuItem(menuItemName: "Dosa", menuItemPrice: 70.0, menuItemDescription: "Delicious")
    ]
    
    var products : [Product] = [
        Product(productId: 10, productName: "P1", productPrice: 100),
        Product(productId: 20, productName: "P2", productPrice: 200),
        Product(productId: 30, productName: "P3", productPrice: 300),
        Product(productId: 40, productName: "P4", productPrice: 400),
        Product(productId: 50, productName: "P5", productPrice: 500),
        Product(productId: 10, productName: "P1", productPrice: 100),
        Product(productId: 20, productName: "P2", productPrice: 200),
        Product(productId: 30, productName: "P3", productPrice: 300),
        Product(productId: 40, productName: "P4", productPrice: 400),
        Product(productId: 50, productName: "P5", productPrice: 500),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSettings()
        registerTableViewWithCell()
    }
    
    func initSettings(){
        menuItemsTableView.dataSource = self
        menuItemsTableView.delegate = self
    }
    
    func registerTableViewWithCell(){
        let uiNib = UINib(nibName: reuseIdentiferForMenuItemTableViewCell, bundle: nil)
        self.menuItemsTableView.register(uiNib, forCellReuseIdentifier: reuseIdentiferForMenuItemTableViewCell)
        
        let uiNib1 = UINib(nibName: "ProductTableViewCell", bundle: nil)
        self.menuItemsTableView.register(uiNib1, forCellReuseIdentifier: "ProductTableViewCell")
    }
}

extension ViewController : UITableViewDataSource{
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Snacks Menu"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        menuItems.count + products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //indexPath.row % 2 == 0  -- to display alternate products and menuitems
        
        if (((indexPath.row + 1) % 3) == 0){
            let menuItemTableViewCell = self.menuItemsTableView.dequeueReusableCell(withIdentifier: reuseIdentiferForMenuItemTableViewCell, for: indexPath) as! MenuItemTableViewCell
            
            menuItemTableViewCell.menuImageView.image = UIImage(named: "test_image_2")
            menuItemTableViewCell.menuItemName.text = menuItems[(indexPath.row - 2)/3].menuItemName
            menuItemTableViewCell.menuItemPrice.text = "\(menuItems[(indexPath.row - 2)/3].menuItemPrice)"
            menuItemTableViewCell.menuItemDescription.text = menuItems[(indexPath.row - 2)/3].menuItemDescription
            
            menuItemTableViewCell.btnMenuDetails.tag = indexPath.row
            //tag to identify button
            
            menuItemTableViewCell.btnMenuDetails.addTarget(self,
                                                           action: #selector(btnMenuDetailsClick),
                                                           for: .touchUpInside)
            return menuItemTableViewCell
        } else {
            let productTableViewCell = self.menuItemsTableView.dequeueReusableCell(withIdentifier: "ProductTableViewCell", for: indexPath) as! ProductTableViewCell
            
            productTableViewCell.productIdLabel.text = "\(products[indexPath.row - (indexPath.row/3)].productId)"
            productTableViewCell.productNameLabel.text = 
            "\(products[indexPath.row - (indexPath.row/3)].productName)"
            return productTableViewCell
        }
    }
    
    @objc func btnMenuDetailsClick(sender : UIButton){
        print(sender.tag)
            
        let menuItemDetailsTableViewController = self.storyboard?.instantiateViewController(withIdentifier:reuseIdentifierForMenuItemTableViewController) as! MenuItemDetailsViewController
        
        menuItemDetailsTableViewController.container = menuItems[(sender.tag - 2)/3]
        
        self.navigationController?.pushViewController(menuItemDetailsTableViewController,
                                    animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if(editingStyle == .delete){
            self.menuItemsTableView.beginUpdates()
            self.menuItemsTableView.deleteRows(at: [indexPath], with: .automatic)
            self.menuItems.remove(at: indexPath.row)
            self.menuItemsTableView.endUpdates()
        }
    }
}

extension ViewController : UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 136.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        let menuItemDetailsTableViewController = self.storyboard?.instantiateViewController(withIdentifier:reuseIdentifierForMenuItemTableViewController) as! MenuItemDetailsViewController
        
        menuItemDetailsTableViewController.container = menuItems[indexPath.row]
        
        self.navigationController?.pushViewController(menuItemDetailsTableViewController,
                                    animated: true)
    }
}
