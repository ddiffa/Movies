//
//  MovieProvider.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation

enum MovieProvider {
    case getMovies
}


extension MovieProvider: Endpoint {
    var base: String {
        return APIConfig.baseUrl.rawValue
    }
    
    var path: String {
        switch self {
            case .getMovies:
                return "/api/v1/Video"
        }
    }
    
    var method: HTTPMethod {
        switch self {
            case .getMovies:
                return .get
        }
    }
}
