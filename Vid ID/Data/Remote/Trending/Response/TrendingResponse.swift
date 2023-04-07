//
//  TrendingResponse.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation

struct TrendingResponse : Codable {
    var adult: Bool?
    var backdropPath: String?
    var genreIds: [Int]?
    var id: Int?
    var originalLanguage: String?
    var originalTitle: String?
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var title: String?
    var video: Bool?
    var voteAverage: Double?
    var voteCount: Int?
    var popularity: Double?
    
    private enum CodingKeys : String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title
        case video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case popularity
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        adult = try? values.decode(Bool.self, forKey: .adult)
        backdropPath = try? values.decode(String.self, forKey: .backdropPath)
        genreIds = try? values.decode([Int].self, forKey: .genreIds)
        id = try? values.decode(Int.self, forKey: .id)
        originalLanguage = try? values.decode(String.self, forKey: .originalLanguage)
        originalTitle = try? values.decode(String.self, forKey: .originalTitle)
        overview = try? values.decode(String.self, forKey: .overview)
        posterPath = try? values.decode(String.self, forKey: .posterPath)
        releaseDate = try? values.decode(String.self, forKey: .releaseDate)
        title = try? values.decode(String.self, forKey: .title)
        video = try? values.decode(Bool.self, forKey: .video)
        voteAverage = try? values.decode(Double.self, forKey: .voteAverage)
        voteCount = try? values.decode(Int.self, forKey: .voteCount)
        popularity = try? values.decode(Double.self, forKey: .popularity)
    }
    
}
