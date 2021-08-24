//
//  CacheImagesViewController.swift
//  FirstApp
//
//  Created by Navi on 7/30/21.
//

import UIKit

class CacheImagesViewController: UIViewController {
    
    let network = NetworkManager.shared
    var postImages: [PostImagesModel] = []
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.displayAnimatedActivityIndicatorView()
        network.posts(query: "puppies") { [weak self] posts, error in
            if let error = error {
                print("error", error)
                return
            }
            self?.postImages = posts!
            DispatchQueue.main.async {
                self?.hideAnimatedActivityIndicatorView()
                self?.collectionView.reloadData()
            }
        }
        
    }
}


extension CacheImagesViewController: UICollisionBehaviorDelegate , UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postImages.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        let post = postImages[indexPath.item]
        
        cell.title.text = post.description
        
        cell.image = nil
        
        let representedIdentifier = post.id
        cell.representedIdentifier = representedIdentifier
        
        func image(data: Data?) -> UIImage? {
            if let data = data {
                return UIImage(data: data)
            }
            return UIImage(systemName: "picture")
        }
        
        network.image(post: post) { data, error  in
            let img = image(data: data)
            DispatchQueue.main.async {
                if (cell.representedIdentifier == representedIdentifier) {
                    cell.image = img
                }
            }
        }
        
        return cell
    }
}

extension CacheImagesViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let  collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2-1 , height: collectionViewWidth/2-1)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
}

