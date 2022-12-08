//
//  AcronymEndpoint.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import Foundation

enum AcronymEndpoint: Endpoint {
    case getAcronymDetails(acronym: String)
    
    var scheme: String {
        switch self {
        default:
            return "http"
        }
    }
    
    var baseURL: String {
        switch self {
        default:
            return Environment.apiBaseURL
        }
    }
    
    var path: String {
        switch self {
        case .getAcronymDetails:
            return "/software/acromine/dictionary.py"
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getAcronymDetails(let acronym):
            return [URLQueryItem(name: "sf", value: acronym)]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAcronymDetails:
            return .get
        }
    }
    
    var headers: Headers {
        switch self {
        default:
            return [:]
        }
    }
    
    func request() -> URLRequest? {
        var components = URLComponents()
        components.scheme = scheme
        components.host = baseURL
        components.path = path
        components.queryItems = parameters
        
        guard let url = components.url else { return nil }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.addHeaders(headers)
        
        return request
    }
}

extension URLRequest {
    mutating func addHeaders(_ headers: Headers) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
}
