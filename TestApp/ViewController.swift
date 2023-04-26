//
//  ViewController.swift
//  TestApp
//
//  Created by BrainX Technologies on 31/03/2023.
//

import UIKit
import Kingfisher


class ViewController: UIViewController, MyCollectionViewDelegate {
 
    
    
    @IBOutlet weak var imageGrid: UICollectionView!
   let photoCollectionDataSource = PhotoCollectionDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // Create a new instance of UINavigationController with self as the root view controller
           let navController = UINavigationController(rootViewController: self)

           // Set the navigation controller as the root view controller of the window
           if let window = UIApplication.shared.windows.first {
             window.rootViewController = navController
             window.makeKeyAndVisible()
           }
        
        
        imageGrid.dataSource = photoCollectionDataSource
        imageGrid.delegate = photoCollectionDataSource
        (imageGrid.dataSource as! PhotoCollectionDataSource).delegate = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        imageGrid.register(nib, forCellWithReuseIdentifier: "gridItem")


        // Set the content inset
        let insets = UIEdgeInsets(top: 10, left: 5, bottom: 10, right: 5)
        imageGrid.contentInset = insets

    }
   
    func didSelectItem(with imageURL: URL) {
        print("this function is being called")
        
        let imageViewController = ImageViewController.instantiate(from: .main)
        imageViewController.imageUrl = imageURL
        
        print(imageURL)
        
        navigationController?.pushViewController(imageViewController, animated: true)

    }
    
   
}

