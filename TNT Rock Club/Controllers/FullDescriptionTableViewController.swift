//
//  FullDescriptionTableViewController.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/22/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit

class FullDescriptionTableViewController: UITableViewController {

    
    @IBOutlet weak var imageOfDish: UIImageView!
    @IBOutlet weak var nameOfDish: UILabel!
    @IBOutlet weak var typeOfDish: UILabel!
    @IBOutlet weak var fullDescription: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction private func backButtonTapped(_ sender: Any){
        dismiss(animated: true, completion: nil)
    }

    

}
