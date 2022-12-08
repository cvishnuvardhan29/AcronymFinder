//
//  Acronym.swift
//  AcronymFinder
//
//  Created by Vishnu Chundi on 12/7/22.
//

import Foundation

struct Acronym: Codable {
    var shortForm: String
    var longForms: [AcronymLongForm]
    
    enum CodingKeys: String, CodingKey {
        case shortForm = "sf"
        case longForms = "lfs"
    }
}

struct AcronymLongForm: Codable {
    var longForm: String
    var since: Int
    
    enum CodingKeys: String, CodingKey {
        case longForm = "lf"
        case since = "since"
    }
}
