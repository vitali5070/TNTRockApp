//
//  MainViewController.swift
//  TNT Rock Club
//
//  Created by Vitaly Nabarouski on 6/29/20.
//  Copyright © 2020 Vitali Nabarouski. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth





class MainViewController: UIViewController {
    
    
    let barArray = ["bar","bar","bar","bar","bar","bar","bar","bar","bar","bar","bar","bar","bar","bar"]
    let kitchenArray = ["kitchen","kitchen","kitchen","kitchen","kitchen","kitchen","kitchen","kitchen","kitchen","kitchen"]
    
    private var collectionView = ProgramCollectionView()
   
    
    let cellScale: CGFloat = 0.5
    
   
    
    @IBOutlet weak var mainView: UIView!
    @IBOutlet var buttonStyle: [UIButton]!
    @IBOutlet var menuButtons: [UIButton]!
    @IBOutlet weak var kitchenButton: UIButton!
    @IBOutlet weak var barButton: UIButton!
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var signOutButton: UIButton!
    @IBOutlet weak var buttonsStack: UIStackView!
    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupButtonStyle()
        setupViews()
        navigationController?.isNavigationBarHidden = true
        
    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      guard let destination = segue.destination as? MenuTableViewController else {return}
       
        if segue.identifier == "Kitchen"{
            destination.title = "Kitchen menu"
            destination.menuArray = kitchenArray
        }else if segue.identifier == "Bar"{
            destination.title = "Bar menu"
            destination.menuArray = barArray
        }
    }
    
 

   private func setupButtonStyle(){
          for button in buttonStyle{
              for button in menuButtons{
                  button.isHidden = true
              }
              button.layer.cornerRadius = button.frame.size.height / 2
              button.setTitleColor(.black, for: .normal)
          }
          
      }
    
    
    
    private func setupViews(){
            
        let collectionViewSizeHeight = mainView.bounds.size.height / 2
            
            view.addSubview(collectionView)
            
            signOutButton.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 20).isActive = true
            signOutButton.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 20).isActive = true
        
        collectionView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: signOutButton.bottomAnchor, constant: 12).isActive = true
        collectionView.heightAnchor.constraint(equalToConstant: collectionViewSizeHeight).isActive = true
        collectionView.widthAnchor.constraint(equalToConstant: mainView.bounds.size.width).isActive = true
            
            buttonsStack.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 12).isActive = true
            buttonsStack.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 40).isActive = true
            buttonsStack.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 40).isActive = true
            buttonsStack.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -10).isActive = true
        
            
        collectionView.set(cells: ProgramModel.fetchProgramData())
  }
    
    
    @IBAction private func menuButtonTapped(){
        menuButtons.forEach { (button) in
            
            UIView.animate(withDuration: 0.1) {
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            }
            
        }
    }
    
    
    
    @IBAction private func signOut(){
        do{
               try Auth.auth().signOut()
              } catch {
                  print(error.localizedDescription)
              }
    }
    
    
  
    

}



