//
//  FavoriteViewController.swift
//  MovieAppUIKit
//
//  Created by Mehtab on 26/05/2023.
//

import UIKit

class FavoriteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var favoriteTableView: UITableView!
    
 
    
    var movies:[Movie] = getMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteTableView.delegate = self
        favoriteTableView.dataSource = self
        
        // Register Cell
        let nib = UINib(nibName: "FavoriteTableViewCell", bundle: nil)
        favoriteTableView.register(nib, forCellReuseIdentifier: "favoriteCell")

    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "favoriteCell", for: indexPath) as! FavoriteTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.title.text = movie.name
        cell.isFavorite.image = UIImage(systemName: "heart.fill")
        cell.movieImage.image = UIImage(named: movie.imageName!)
        cell.ratingLabel.text = "Rating: \(movie.rating)"
        cell.descriptionLabel.text = movie.description
        
        cell.favouriteAction = {
            //
        }

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    //    performSegue(withIdentifier: "segue_favourite_to_detail", sender: self)
        let vc = DetailViewController2()
        self.navigationController?.present(vc, animated: true)
    }

}
