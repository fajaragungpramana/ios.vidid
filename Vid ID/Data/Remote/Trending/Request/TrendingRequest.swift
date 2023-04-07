//
//  TrendingRequest.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

struct TrendingRequest {
    var mediaType: MediaType
    var timeWindow: TimeWindow
    
    enum MediaType : String {
        case ALL = "all"
        case MOVIE = "movie"
        case TV = "tv"
        case PERSON = "person"
    }
    
    enum TimeWindow : String {
        case DAY = "day"
        case WEEK = "week"
    }
    
    func toRequest() -> [String : String] {
        return [
            "media_type" : mediaType.rawValue,
            "time_window" : timeWindow.rawValue
        ]
    }
    
}
