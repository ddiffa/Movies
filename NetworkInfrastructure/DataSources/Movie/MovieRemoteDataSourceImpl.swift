//
//  MovieRemoteDataSource.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import Data
import RxSwift
import Domain

final class MovieRemoteDataSourceImpl: MovieRemoteDataSource {
    private let client: MovieClient
    
    init(client: MovieClient) {
        self.client = client
    }
    
    func getMovies() -> Observable<[Movie]> {
        return client.getMovies()
    }
}
