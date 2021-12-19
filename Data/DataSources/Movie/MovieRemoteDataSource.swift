//
//  MovieRemoteDataSource.swift
//  Data
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import Domain
import RxSwift

public protocol MovieRemoteDataSource {
    func getMovies() -> Observable<[Movie]>
}
