//
//  MenuTableViewCell.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 6/30/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

  
    @IBOutlet weak var imageDish: UIImageView!
    @IBOutlet weak var labelNameOFDish: UILabel!
    @IBOutlet weak var LabelTypeOfDish: UILabel!
    @IBOutlet weak var labelShortList: UILabel!
    @IBOutlet weak var labelPrice: UILabel!
    
    var fullDescriprion: String = ""
}
