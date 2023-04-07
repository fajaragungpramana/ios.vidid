//
//  AppResponse.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

struct AppResponse<T : Codable> : Codable {
    var page: Int?
    var results: T?
    
    private enum CodingKeys : String, CodingKey {
        case page
        case results
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        page = try? values.decode(Int.self, forKey: .page)
        results = try? values.decode(T.self, forKey: .results)
    }
    
}
