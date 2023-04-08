//
//  SeriesPopularRequest.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import Foundation

struct SeriesPopularRequest {
    var language: String = "en-US"
    var page: Int = 1
    
    func toRequest() -> [String : Any] {
        return [
            "language" : language,
            "page" : page
        ]
    }
    
}
