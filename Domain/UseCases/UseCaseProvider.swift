//
//  UseCaseProvider.swift
//  Domain
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation

public protocol UseCaseProvider {
    func movieUseCase() -> MovieUseCase
}
