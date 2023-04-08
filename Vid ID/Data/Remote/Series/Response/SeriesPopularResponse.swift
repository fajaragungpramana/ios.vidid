//
//  SeriesPopularResponse.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import Foundation

struct SeriesPopularResponse : Codable {
    var posterPath: String?
    var popularity: Double?
    var id: Int?
    var backdropPath: String?
    var voteAverage: Double?
    var overview: String?
    var firstAirDate: String?
    var originCountry: [String]?
    var genreIds: [Int]?
    var originalLanguage: String?
    var voteCount: Int?
    var name: String?
    var originalName: String?
    
    private enum CodingKeys : String, CodingKey {
        case posterPath = "poster_path"
        case popularity
        case id
        case backdropPath = "backdrop_path"
        case voteAverage = "vote_average"
        case overview
        case firstAirDate = "first_air_date"
        case originCountry = "origin_country"
        case genreIds = "genre_ids"
        case originalLanguage = "original_language"
        case voteCount = "vote_count"
        case name
        case originalName = "original_name"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        posterPath = try? values.decode(String.self, forKey: .posterPath)
        popularity = try? values.decode(Double.self, forKey: .popularity)
        id = try? values.decode(Int.self, forKey: .id)
        backdropPath = try? values.decode(String.self, forKey: .backdropPath)
        voteAverage = try? values.decode(Double.self, forKey: .voteAverage)
        overview = try? values.decode(String.self, forKey: .overview)
        firstAirDate = try? values.decode(String.self, forKey: .firstAirDate)
        originCountry = try? values.decode([String].self, forKey: .originCountry)
        genreIds = try? values.decode([Int].self, forKey: .genreIds)
        originalLanguage = try? values.decode(String.self, forKey: .originalLanguage)
        voteCount = try? values.decode(Int.self, forKey: .voteCount)
        name = try? values.decode(String.self, forKey: .name)
        originalName = try? values.decode(String.self, forKey: .originalName)
    }
    
}
