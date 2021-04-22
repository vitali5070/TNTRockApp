//
//  ProgramCollectionView.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/20/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit

class ProgramCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    

    var cells = [ProgramModel]()
    
    
    init(){
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        
        backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        delegate = self
        dataSource = self
        register(ProgramCollectionViewCell.self, forCellWithReuseIdentifier: ProgramCollectionViewCell.reuseId)
        
        translatesAutoresizingMaskIntoConstraints = false
        layout.minimumLineSpacing = Constants.programMinimumLineSpacing
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        
        showsVerticalScrollIndicator = false
        showsHorizontalScrollIndicator = false
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(cells: [ProgramModel]){
        self.cells = cells
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ProgramCollectionViewCell.reuseId, for: indexPath) as! ProgramCollectionViewCell
        
        cell.backgroundColorView.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        cell.bandNameLabel.text = cells[indexPath.row].bandNameLabel
        cell.dataTitleLabel.text = cells[indexPath.row].dataLabel
        cell.programImageView.image = cells[indexPath.row].programImage
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.programItemWidth, height: frame.height * 0.8)
    }
}
