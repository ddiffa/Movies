//
//  UseCaseProvider.swift
//  Data
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import Domain

public class UseCaseProviderImpl: UseCaseProvider {
    private let remoteDataSource: RemoteDataSource
    
    public init(remoteDataSource: RemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }
    
    public func movieUseCase() -> MovieUseCase {
        let remoteDataSource = self.remoteDataSource.movieDataSource()
        return MovieRepository(remoteDataSource: remoteDataSource)
    }
}
