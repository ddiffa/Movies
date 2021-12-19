//
//  MovieClient.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import UIKit
import RxSwift
import Domain

class MovieClientImpl: APIClient, MovieClient {
    let session: URLSession
    
    init(configuration: URLSessionConfiguration) {
        self.session = URLSession(configuration: configuration)
    }
    
    convenience init() {
        let configuration: URLSessionConfiguration = .default
        configuration.requestCachePolicy = .reloadIgnoringLocalCacheData
        
        self.init(configuration: configuration)
    }
    
    func getMovies() -> Observable<[Movie]> {
        let request = MovieProvider.getMovies.request
        
        return Observable<[Movie]>.create { observer in
            
            self.fetch(with: request,
                       decode: { json -> [MovieResponse] in
                guard let movieResult = json as? [MovieResponse] else { return [] }
                return movieResult
            }) { result in
                switch result {
                    case .success(let json):
                        let data = json.map{ $0.asDomain()}
                        observer.onNext(data)
                        observer.onCompleted()
                    case .failure(let error):
                        observer.onError(error)
                }
            }
            
            return Disposables.create()
        }
    }
}
