//
//  SeriesPopular.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import Foundation

struct SeriesPopular {
    var id: Int
    var posterPath: String
    var name: String
    
    static func mapList(listSeriesPopularResponse: [SeriesPopularResponse]?) -> [SeriesPopular] {
        var data = [SeriesPopular]()
        
        listSeriesPopularResponse?.forEach { seriesPopularResponse in
            data.append(
                SeriesPopular(
                    id: seriesPopularResponse.id.onNull(),
                    posterPath: "\(Constant.PRODUCTION_IMAGE_GATEWAY)\(seriesPopularResponse.posterPath.onNull())",
                    name: seriesPopularResponse.name.onNull()
                )
            )
        }
        
        return data
    }
    
}
