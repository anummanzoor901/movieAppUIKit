//
//  FavoriteTableViewCell.swift
//  MovieAppUIKit
//
//  Created by Mehtab on 26/05/2023.
//

import UIKit

class FavoriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var isFavorite: UIImageView!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var favouriteAction:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 10
        
        let tapGester = UITapGestureRecognizer(target: self, action: #selector(favouriteTap))
        isFavorite.addGestureRecognizer(tapGester)
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func favouriteTap() {
        favouriteAction?()
    }

}
