//
//  ViewController.swift
//  TestApp
//
//  Created by BrainX Technologies on 31/03/2023.
//

import UIKit


class ViewController: UIViewController {
    
    var imagesList: [String] = ["https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nationalgeographic.com%2Fanimals%2Fmammals%2Ffacts%2Fdomestic-cat&psig=AOvVaw0AzcYOtibxXUukXCp4MVnV&ust=1681973166944000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNiAyLustf4CFQAAAAAdAAAAABAD", "https://www.google.com/url?sa=i&url=https%3A%2F%2Fm.economictimes.com%2Fnews%2Finternational%2Fus%2Ftop-seven-cat-breeds-see-list%2Fslideshow%2F98637536.cms&psig=AOvVaw0AzcYOtibxXUukXCp4MVnV&ust=1681973166944000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNiAyLustf4CFQAAAAAdAAAAABAI","https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.nbcnews.com%2Fthink%2Fopinion%2Fcats-cute-furry-cuddly-invasive-alien-species-rcna41768&psig=AOvVaw0AzcYOtibxXUukXCp4MVnV&ust=1681973166944000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNiAyLustf4CFQAAAAAdAAAAABAR","https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pexels.com%2Fsearch%2Fcats%2F&psig=AOvVaw0AzcYOtibxXUukXCp4MVnV&ust=1681973166944000&source=images&cd=vfe&ved=0CBEQjRxqFwoTCNiAyLustf4CFQAAAAAdAAAAABAa",]

    @IBOutlet weak var imageGrid: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        imageGrid.delegate = self
        imageGrid.dataSource = self
        
        let nib = UINib(nibName: "CollectionViewCell", bundle: nil)
        imageGrid.register(nib, forCellWithReuseIdentifier: "gridItem")
    }
   

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource{
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
            
            // Download the image data asynchronously
            URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
                print("something went wrong")
             
                
                guard let data = data else { return }
                print(data)
                
                DispatchQueue.main.async {
                    // Create an image from the downloaded data and set it in the cell's image view
                    cell.imageView.image = UIImage(data: data)
                }
            }.resume()
        cell.backgroundColor = .lightGray
            
            return cell
        
    }
   
}

