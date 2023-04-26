//
//  ImageViewController.swift
//  TestApp
//
//  Created by BrainX Technologies on 26/04/2023.
//

import UIKit
import Kingfisher

class ImageViewController: UIViewController {
    
    @IBOutlet var catImageView: UIImageView!
    
    var imageUrl: URL!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let resource = ImageResource(downloadURL: imageUrl)
        catImageView.kf.indicatorType = .activity
        catImageView.kf.setImage(with: resource)
    }
}
