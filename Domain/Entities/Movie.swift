//
//  Movie.swift
//  Domain
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation

public struct Movie {
    public let id: String
    public let title: String
    public let description: String
    public let posterPath: URL?
    public let videoUrl: URL?
    
    public init(id: String,
                title: String,
                description: String,
                posterPath: URL?,
                videoUrl: URL?) {
        self.id = id
        self.title = title
        self.description = description
        self.posterPath = posterPath
        self.videoUrl = videoUrl
    }
}
