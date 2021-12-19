//
//  NetworkError.swift
//  Core
//
//  Created by Diffa Desyawan on 15/12/21.
//

import Foundation

public enum APIError: Error {
    case networkProblem
    case notFound
    case badRequest
    case requestFailed
    case invalidData
    case unknwon(HTTPURLResponse?)
    
    public init(response: URLResponse?) {
        guard let response = response as? HTTPURLResponse else {
            self = .unknwon(nil)
            return
        }
        
        switch response.statusCode {
            case 400:
                self = .badRequest
            case 404:
                self = .notFound
            default:
                self = .unknwon(response)
        }
    }
    
    var description: String {
        switch self {
            case .notFound:
                return ErrorMessages.NotFound
            case .networkProblem, .unknwon(_):
                return ErrorMessages.ServeError
            case .requestFailed, .badRequest, .invalidData:
                return ErrorMessages.RequestFaield
        }
    }
}


extension APIError {
    struct ErrorMessages {
        static let ServeError = "Serve Error. Please, try again later."
        static let NotFound = "Bad request error."
        static let RequestFaield = "Request failed. Please, try again later."
    }
}
