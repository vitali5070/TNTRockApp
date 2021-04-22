//
//  MenuViewController.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 6/30/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit


class MenuTableViewController: UITableViewController{
    
    
    @IBOutlet weak var searchBar: UISearchBar!

    

    var menuArray: Array<String> = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = false
        tableView.isScrollEnabled = true
        
        
    }
    
    
    // MARK: - Table view data source

   

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return menuArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell

        cell.labelNameOFDish.text = menuArray[indexPath.row]
        cell.fullDescriprion = "Full Description"
        cell.LabelTypeOfDish.text = "Type OF Dish"
        cell.imageDish.image = #imageLiteral(resourceName: "tnt_logo")
        cell.labelPrice.text = "15Br"
        cell.labelShortList.text = "Short Description"
        
        cell.imageDish.layer.cornerRadius = cell.imageDish.frame.size.height / 2
        cell.imageDish.clipsToBounds = true
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let destination = segue.destination as? FullDescriptionTableViewController else {return}
        
    }
   
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addTapped(_ sender: UIBarButtonItem) {
    }
    
}
