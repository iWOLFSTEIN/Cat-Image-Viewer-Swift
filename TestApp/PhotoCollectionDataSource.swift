//
//  PhotoCollectionDataSource.swift
//  TestApp
//
//  Created by BrainX Technologies on 19/04/2023.
//

import Foundation
import UIKit
import Kingfisher



protocol MyCollectionViewDelegate: AnyObject {
  func didSelectItem(with imageURL: URL)
}


class PhotoCollectionDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate {
    
    weak var delegate: MyCollectionViewDelegate?

    
    var imagesList: [String] = ["https://static01.nyt.com/images/2022/11/29/science/00tb-cats1/00tb-cats1-mediumSquareAt3X.jpg",
        "https://www.humanesociety.org/sites/default/files/2022-08/hl-yp-cats-579652.jpg",
        "https://med.stanford.edu/content/dam/sm-news/images/2021/09/cat_by-Kateryna-T-Unsplash.jpg",
        "https://www.alleycat.org/wp-content/uploads/2019/03/FELV-cat.jpg",
    ]
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imagesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
          return CGSize(width: 200, height: 200)
      }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gridItem", for: indexPath) as! CollectionViewCell

        let image_url: String = imagesList[indexPath.row]
        let imageUrl = URL(string: image_url)!
        
        let resource = ImageResource(downloadURL: imageUrl)
        cell.imageView.kf.indicatorType = .activity
        cell.imageView.kf.setImage(with: resource)
        cell.imageView.isUserInteractionEnabled = false
        
        cell.backgroundColor = .lightGray
            
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        _ = collectionView.cellForItem(at: indexPath) as! CollectionViewCell
        
        let image_url: String = imagesList[indexPath.row]
        let imageUrl = URL(string: image_url)!
//        let resource = ImageResource(downloadURL: imageUrl)
        
        
        print("something")
        delegate?.didSelectItem(with: imageUrl)


    }
}
