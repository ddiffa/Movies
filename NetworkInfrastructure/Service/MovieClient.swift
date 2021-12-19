//
//  MovieClientProtocol.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import RxSwift
import Domain

protocol MovieClient {
    func getMovies() -> Observable<[Movie]>
}
