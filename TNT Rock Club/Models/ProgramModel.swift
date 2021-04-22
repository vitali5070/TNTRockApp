//
//  ProgramModel.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/16/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit
import Firebase


struct ProgramModel{
    
    
    var dataLabel: String
    var bandNameLabel: String
    var programImage: UIImage?
    var color: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
    
    init( dataLabel: String,bandNameLabel: String, programImage: UIImage?, color: UIColor) {
        
        
        self.dataLabel = dataLabel
        self.bandNameLabel = bandNameLabel
        self.programImage = programImage
        self.color = color
    }
    
    
    static func fetchProgramData() -> [ProgramModel]{
        let first = ProgramModel(dataLabel: "25.07.2020", bandNameLabel: "TNT Birthday Party", programImage: #imageLiteral(resourceName: "program"), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        let second = ProgramModel(dataLabel: "26.07.2020", bandNameLabel: "TNT Birthday After Party", programImage: #imageLiteral(resourceName: "program"), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        let third = ProgramModel(dataLabel: "27.07.2020", bandNameLabel: "Halloween Party", programImage: #imageLiteral(resourceName: "program"), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        let fourth = ProgramModel(dataLabel: "28.07.2020", bandNameLabel: "Beach Party", programImage: #imageLiteral(resourceName: "program"), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        let five = ProgramModel(dataLabel: "29.07.2020", bandNameLabel: "MM Banda", programImage: #imageLiteral(resourceName: "program"), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        let six = ProgramModel(dataLabel: "30.07.2020", bandNameLabel: "Last Day of july", programImage: #imageLiteral(resourceName: "program"), color: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
        
        return [first, second, third, fourth, five, six]
    }
}


struct Constants {
    static let screenSize = UIScreen.main.bounds.size
    static let leftDistanceToView: CGFloat = 40
    static let rightDistanceToView: CGFloat = 40
    static let programMinimumLineSpacing: CGFloat = 20
    static let programItemWidth = (screenSize.width - Constants.leftDistanceToView - Constants.rightDistanceToView - (Constants.programMinimumLineSpacing / 2)) / 2
}

