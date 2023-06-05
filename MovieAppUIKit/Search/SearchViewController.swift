//
//  SearchViewController.swift
//  MovieAppUIKit
//
//  Created by Mehtab on 25/05/2023.
//

import UIKit

func getMovies() -> [Movie] {
    let movies = [
        Movie(name: "The Godfather", rating: 9, imageName: "godfather", description: "The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son. The aging patriarch of an organized crime dynasty transfers control of his clandestine empire to his reluctant son.", isFavorite: false
              , isDisliked: false),
        Movie(name: "The Shawshank Redemption", rating: 9, imageName: "shawshank", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", isFavorite: false, isDisliked: false),
        Movie(name: "The Dark Knight", rating: 8, imageName: "darkknight", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", isFavorite: false, isDisliked: false),
        Movie(name: "Pulp Fiction", rating: 8, imageName: "pulpfiction", description: "The lives of two mob hitmen, a boxer, a gangster and his wife, and a pair of diner bandits intertwine in four tales of violence and redemption.", isFavorite: false, isDisliked: false),
        Movie(name: "The Lord of the Rings: The Return of the King", rating: 9, imageName: "lotr", description: "Gandalf and Aragorn lead the World of Men against Sauron's army to draw his gaze from Frodo and Sam as they approach Mount Doom with the One Ring.", isFavorite: false, isDisliked: false)
    ]
    return movies
}






class SearchViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var saerchTableView: UITableView!
    
    var movies:[Movie] = getMovies()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        saerchTableView.delegate = self
        saerchTableView.dataSource = self
        
        // Register Cell
        let nib = UINib(nibName: "SearchTableViewCell", bundle: nil)
        saerchTableView.register(nib, forCellReuseIdentifier: "searchCell")

    }
    

    @IBAction func cancelAction(_ sender: Any) {
    }
    
    
    //// TableView ////
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchTableViewCell
        
        let movie = movies[indexPath.row]
        
        cell.title.text = movie.name
        cell.favouriteImage.image = UIImage(systemName: movie.isFavorite == true ? "heart.fill" : "heart")
        cell.movieImage.image = UIImage(named: movie.imageName!)
        cell.ratingLabel.text = "Rating: \(movie.rating)"
        cell.descriptionLable.text = movie.description
        
        cell.favouriteAction = {
            // favourite tap
            
        }
        
        cell.donotShowAction = {
            // donot show again tap
        }

        return cell

    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   //     performSegue(withIdentifier: "segue_search_to_detail", sender: self)
        let vc = DetailViewController2()
        self.navigationController?.present(vc, animated: true)
    }
}
