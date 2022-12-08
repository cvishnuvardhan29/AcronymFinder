//
//  Endpoint.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import Foundation

enum HTTPMethod: String {
    case get
    case post
    case put
    case delete
}

typealias Headers = [String : String]

protocol Endpoint {
    var scheme: String { get }
    var baseURL: String { get }
    var path: String { get }
    var parameters: [URLQueryItem]? { get }
    var method: HTTPMethod { get }
    var headers: Headers { get }
    func request() -> URLRequest?
}
