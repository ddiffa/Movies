//
//  RemoteDataSource.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import Data

final public class RemoteDataSourceImpl: RemoteDataSource {
    
    public init() {}
    
    public func movieDataSource() -> MovieRemoteDataSource {
        let client = MovieClientImpl()
        return MovieRemoteDataSourceImpl(client: client)
    }
}
