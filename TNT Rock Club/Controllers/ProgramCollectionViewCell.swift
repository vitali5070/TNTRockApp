//
//  ProgramCollectionViewCell.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 7/16/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit


class ProgramCollectionViewCell: UICollectionViewCell {
    
    
    static let reuseId = "ProgramCollectionViewCell"
    
     var programImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10.0
        imageView.layer.masksToBounds = true
        return imageView
    }()
     var backgroundColorView: UIView! = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 10.0
        view.layer.masksToBounds = true
        view.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5)
        return view
    }()
    var dataTitleLabel: UILabel = {
    let label = UILabel()
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 17, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 1
       return label
    }()
    var bandNameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
         label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         label.textColor = .white
         label.translatesAutoresizingMaskIntoConstraints = false
         label.numberOfLines = 0
        return label
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        addSubview(programImageView)
        addSubview(backgroundColorView)
        addSubview(dataTitleLabel)
        addSubview(bandNameLabel)
        
        backgroundColor = .white
        
        // programImageView constraints
        
        programImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        programImageView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        programImageView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        programImageView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        // backgroundColorView constraints
        
        backgroundColorView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backgroundColorView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backgroundColorView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backgroundColorView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
        // bandNameLabel constraints
        
        bandNameLabel.heightAnchor.constraint(equalToConstant: 150).isActive = true
        bandNameLabel.widthAnchor.constraint(equalToConstant: 140).isActive = true
        bandNameLabel.centerYAnchor.constraint(equalTo: programImageView.centerYAnchor).isActive = true
        bandNameLabel.centerXAnchor.constraint(equalTo: programImageView.centerXAnchor).isActive = true
        
        // dataTitleLabel constraints
        
        dataTitleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        dataTitleLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        dataTitleLabel.bottomAnchor.constraint(equalTo: backgroundColorView.bottomAnchor, constant: 10).isActive = true
        dataTitleLabel.centerXAnchor.constraint(equalTo: backgroundColorView.centerXAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 10.0
        self.layer.shadowRadius = 7
        layer.shadowColor = CGColor(srgbRed: 178, green: 178, blue: 178, alpha: 50)
        layer.shadowOpacity = 0.3
        layer.shadowOffset = CGSize(width: 3, height: 5)
        
        self.clipsToBounds = false
        
    }
    
    
    var program: ProgramModel!{
        didSet{
            self.updateUI()
        }
    }
    
    
    
    
    func updateUI(){
        if let program = program{
            programImageView.image = program.programImage
            programImageView.translatesAutoresizingMaskIntoConstraints = false
            dataTitleLabel.text = program.dataLabel
            bandNameLabel.text = program.bandNameLabel
            backgroundColorView.backgroundColor = program.color
        } else{
            programImageView.image = nil
            dataTitleLabel.text = nil
            bandNameLabel.text = nil
            backgroundColorView.backgroundColor = nil
        }
        
     
    }
}
