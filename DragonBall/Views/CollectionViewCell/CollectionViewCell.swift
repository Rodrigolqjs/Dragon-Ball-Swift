//
//  CollectionViewCell.swift
//  DragonBall
//
//  Created by Rodrigo Latorre on 13/07/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroLabel: UILabel!
    
    func set(model: Hero) {
        heroImage.setImage(url: model.photo)
        heroLabel.text = model.name
    }
    
}
