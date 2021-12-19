//
//  RemoteDataSource.swift
//  Data
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation

public protocol RemoteDataSource {
    func movieDataSource() -> MovieRemoteDataSource
}
