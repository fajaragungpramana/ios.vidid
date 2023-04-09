//
//  MoviePopularResponse.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import Foundation

struct MoviePopularResponse : Codable {
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    var genreIds: [Int]?
    var id: Int?
    var originalTitle: String?
    var originalLanguage: String?
    var title: String?
    var backdropPath: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Double?
    
    private enum CodingKeys : String, CodingKey {
        case posterPath = "poster_path"
        case adult
        case overview
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
        case id
        case originalTitle = "originalTitle"
        case originalLanguage = "original_language"
        case title
        case backdropPath = "backdrop_path"
        case popularity
        case voteCount = "vote_count"
        case video
        case voteAverage = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        posterPath = try? values.decode(String.self, forKey: .posterPath)
        adult = try? values.decode(Bool.self, forKey: .adult)
        overview = try? values.decode(String.self, forKey: .overview)
        releaseDate = try? values.decode(String.self, forKey: .releaseDate)
        genreIds = try? values.decode([Int].self, forKey: .genreIds)
        id = try? values.decode(Int.self, forKey: .id)
        originalTitle = try? values.decode(String.self, forKey: .originalTitle)
        originalLanguage = try? values.decode(String.self, forKey: .originalLanguage)
        title = try? values.decode(String.self, forKey: .title)
        backdropPath = try? values.decode(String.self, forKey: .backdropPath)
        popularity = try? values.decode(Double.self, forKey: .popularity)
        voteCount = try? values.decode(Int.self, forKey: .id)
        video = try? values.decode(Bool.self, forKey: .video)
        voteAverage = try? values.decode(Double.self, forKey: .voteAverage)
    }
    
}
