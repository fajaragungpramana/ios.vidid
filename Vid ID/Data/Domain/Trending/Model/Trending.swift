//
//  Trending.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

struct Trending {
    var id: Int
    var posterPath: String
    var title: String
    var overview: String
    
    static func mapList(listTrendingResponse: [TrendingResponse]?) -> [Trending] {
        var data = [Trending]()
        
        listTrendingResponse?.forEach { trendingResponse in
            data.append(
                Trending(
                    id: trendingResponse.id.onNull(),
                    posterPath: "\(Constant.PRODUCTION_IMAGE_GATEWAY)\(trendingResponse.posterPath.onNull())",
                    title: trendingResponse.title.onNull(),
                    overview: trendingResponse.overview.onNull())
            )
        }
        
        return data
    }
    
}
