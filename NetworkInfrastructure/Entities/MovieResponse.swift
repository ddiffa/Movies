//
//  Movie.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import Domain

public struct MovieResponse: Decodable {
    
    let id: String
    let title: String
    let description: String
    let posterPath: String
    let videoUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case title
        case description
        case posterPath = "poster_path"
        case videoUrl = "video_url"
    }
}


extension MovieResponse {
    func asDomain() -> Movie {
        return .init(id: id,
                     title: title,
                     description: description,
                     posterPath: URL(string: posterPath),
                     videoUrl: URL(string: videoUrl))
    }
}
