//
//  SearchTableViewCell.swift
//  MovieAppUIKit
//
//  Created by Mehtab on 25/05/2023.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var favouriteImage: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var descriptionLable: UILabel!
    @IBOutlet weak var donotShowAgainButton: UIButton!
    
    var favouriteAction:(() -> Void)?
    var donotShowAction:(() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        movieImage.layer.cornerRadius = 10
        
        let tapGester = UITapGestureRecognizer(target: self, action: #selector(favouriteTap))
        favouriteImage.addGestureRecognizer(tapGester)
    }

    
    @IBAction func donotShowAction(_ sender: Any) {
        donotShowAction?()
    }
    
    @objc func favouriteTap() {
        favouriteAction?()
    }
    
}
