//
//  APIManager.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import Foundation

enum APIError: Error {
    case invalidRequest
    case invalidData
}

class APIManager {
    
    /**
     Executes the web call and decode the JSON response into the codable object provided
     - Parameters:
        - endpoint: The endpoint make the HTTP request
        - completion: The JSON response converted to the provided codable object if successful or failure otherwise
     */
    func request<T: Codable>(endpoint: Endpoint, completion: @escaping (Result<T, APIError>) -> ()) {
        guard let urlRequest = endpoint.request() else {
            completion(.failure(APIError.invalidRequest))
            return
        }
        
        let session = URLSession(configuration: .default)
        let dataTask = session.dataTask(with: urlRequest) { data, response, error in
            guard let responseData = data else {
                completion(.failure(APIError.invalidData))
                return
            }
            do {
                let responseObject = try JSONDecoder().decode(T.self, from: responseData)
                completion(.success(responseObject))
            } catch {
                completion(.failure(APIError.invalidData))
            }
        }
        dataTask.resume()
    }
}
