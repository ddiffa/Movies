//
//  MovieUseCase.swift
//  Domain
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation
import RxSwift

public protocol MovieUseCase {
    func getMovies() -> Observable<[Movie]>
}
