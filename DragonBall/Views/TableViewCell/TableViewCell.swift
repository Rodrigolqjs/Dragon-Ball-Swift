//
//  TableViewCell.swift
//  DragonBall
//
//  Created by Rodrigo Latorre on 8/07/22.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var heroName: UILabel!
    @IBOutlet weak var heroDescription: UILabel!
    @IBOutlet weak var heroImage: UIImageView!
    
    func set(model: Hero) {
        self.heroName.text = model.name
        self.heroDescription.text = model.description
        self.heroImage.setImage(url: model.photo) 
    }
    
}
