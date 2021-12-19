//
//  ViewController.swift
//  MovieDB
//
//  Created by Diffa Desyawan on 15/12/21.
//

import UIKit
import NetworkInfrastructure
import RxSwift
import Data
import Domain
import AVKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var movieTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    private var viewModel: HomeViewModel?
    private var disposeBag: DisposeBag = DisposeBag()
    
    private var movies: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: MoviesTableViewCell.identifier, bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: MoviesTableViewCell.identifier)
        
        viewModel = HomeViewModel(useCaseProvider: UseCaseProviderImpl(remoteDataSource: RemoteDataSourceImpl()))
        
        bind()
    }
    
    private func bind() {
        guard let viewModel = viewModel else {
            return
        }
        
        viewModel.fetchMovies()
            .observeOn(MainScheduler.instance)
            .subscribe(onNext: { movies in
                self.movies = movies
            }, onError: { error in
                print("error: \(error)")
            }, onCompleted: {
                self.movieTableView.reloadData()
                self.activityIndicator.isHidden = true
            }).disposed(by: disposeBag)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: MoviesTableViewCell.identifier) as? MoviesTableViewCell {
            cell.movie = movies[indexPath.row]
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let url = movies[indexPath.row].videoUrl else { return }
        
        VideoPlayerHelper.shared.playVideo(url: url) { controller in
            self.present(controller, animated: false)
        }
    }
}
