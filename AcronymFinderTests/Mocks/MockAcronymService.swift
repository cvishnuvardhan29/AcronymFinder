//
//  MockAcronymService.swift
//  AcronymFinderTests
//
//  Created by Vishnu Chundi on 12/8/22.
//

@testable import AcronymFinder

struct MockAcronymService {
    typealias FetchAcronymResult = Result<[Acronym], APIError>
    
    func fetchAcronymDetails(with apiManager: APIManager, completion: @escaping (FetchAcronymResult) -> Void) {
        apiManager.request(endpoint: AcronymEndpoint.getAcronymDetails(acronym: "NASA")) { (result: FetchAcronymResult) in
            completion(result)
        }
    }
}
