//
//  CollectionViewCell.swift
//  FirstApp
//
//  Created by Navi on 7/30/21.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var img: UIImageView!
    var representedIdentifier: String = ""
    
      
    var titlelabel: String? {
        didSet {
          title.text = titlelabel
        }
      }
    
      var image: UIImage? {
        didSet {
          img.image = image
        }
      }
}
