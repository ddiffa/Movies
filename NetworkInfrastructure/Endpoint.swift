//
//  Endpoint.swift
//  NetworkInfrastructure
//
//  Created by Diffa Desyawan on 18/12/21.
//

import Foundation


protocol Endpoint {
    var base: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
}

extension Endpoint {
    var urlComponents: URLComponents {
        var components = URLComponents(string: base)!
        components.path = path
        
        
        return components
    }
    
    var request: URLRequest {
        let url = urlComponents.url!
        var request = URLRequest(url: url)
        
        request.httpMethod = method.rawValue
        
        return request
    }
}

enum HTTPMethod: String {
    case get = "GET"
}
