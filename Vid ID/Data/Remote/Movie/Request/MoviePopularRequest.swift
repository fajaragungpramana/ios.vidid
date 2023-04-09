//
//  MoviePopularRequest.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import Foundation

struct MoviePopularRequest {
    var language: String = "en-US"
    var page: Int = 1
    var region: String = ""
    
    func toRequest() -> [String : Any] {
        return [
            "language" : language,
            "page" : page,
            "region" : region
        ]
    }
    
}
