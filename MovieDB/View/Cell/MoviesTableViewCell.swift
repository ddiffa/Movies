//
//  MoviesTableViewCell.swift
//  MovieDB
//
//  Created by Diffa Desyawan on 20/12/21.
//

import UIKit
import Domain
import Kingfisher

class MoviesTableViewCell: UITableViewCell {
    static let identifier: String = "MoviesTableViewCell"
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var thumbnailView: UIImageView!
    
    var movie: Movie? {
        didSet {
            guard let movie = movie else {
                return
            }
            setUpView(movie: movie)
        }
    }
    
    private func setUpView(movie: Movie) {
        titleLabel.text = movie.title
        thumbnailView.kf.indicatorType = .activity
        thumbnailView.kf.setImage(with: movie.posterPath)
        descriptionLabel.text = movie.description
    }
}
