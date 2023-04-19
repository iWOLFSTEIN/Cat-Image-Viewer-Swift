//
//  ViewController.swift
//  TestApp
//
//  Created by BrainX Technologies on 31/03/2023.
//

import UIKit
import Kingfisher


class ViewController: UIViewController {
    
    
    @IBOutlet weak var imageGrid: UICollectionView!
   let photoCollectionDataSource = PhotoCollectionDataSource()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
       
        imageGrid.dataSource = photoCollectionDataSource
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        imageGrid.register(nib, forCellWithReuseIdentifier: "gridItem")
    }
   

}

