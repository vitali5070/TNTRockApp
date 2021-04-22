//
//  MenuVC.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/14/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit

class MenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

   
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    var menuArray: Array<String> = ["Cell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.isNavigationBarHidden = false
        tableView.isScrollEnabled = true
        
    }
    

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        cell.labelNameOFDish.text = menuArray[indexPath.row]
        
        cell.imageDish.layer.cornerRadius = cell.imageDish.frame.size.height / 2
        cell.imageDish.clipsToBounds = true
        
        return cell
    }
    

}
