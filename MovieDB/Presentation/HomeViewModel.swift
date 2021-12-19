//
//  HomeViewModel.swift
//  MovieDB
//
//  Created by Diffa Desyawan on 19/12/21.
//

import Foundation
import Domain
import RxSwift

class HomeViewModel {
    private let movieUseCase: MovieUseCase
    let movies = PublishSubject<Movie>()
    
    init(useCaseProvider: UseCaseProvider) {
        movieUseCase = useCaseProvider.movieUseCase()
    }
    
    func fetchMovies() -> Observable<[Movie]> {
        return movieUseCase.getMovies()
    }
}
