//
//  MovieRepository.swift
//  Data
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import Domain
import RxSwift

public class MovieRepository: MovieUseCase {
    private var remoteDataSource: MovieRemoteDataSource
    
    init(remoteDataSource: MovieRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func getMovies() -> Observable<[Movie]> {
        return remoteDataSource.getMovies()
    }
}
