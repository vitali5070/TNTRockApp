//
//  MenuViewController.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 6/30/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit


class MenuTableViewController: UITableViewController {
    
    

    
    
    
    let kitchenArray = ["salad","soup","hot dish","aperetive"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        preferredContentSize = CGSize(width: tableView.frame.width, height: tableView.contentSize.height)
    }
    
    

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return kitchenArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        cell.labelDish.text = kitchenArray[indexPath.row]
        
        cell.imageDish.layer.cornerRadius = cell.imageDish.frame.size.height / 2
        cell.imageDish.clipsToBounds = true
        
        return cell
    }
   
    
    
}
