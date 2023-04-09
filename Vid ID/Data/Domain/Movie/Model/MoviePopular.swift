//
//  MoviePopular.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import Foundation

struct MoviePopular {
    var id: Int
    var posterPath: String
    var title: String
    var overview: String
    
    static func mapList(listMoviePopularResponse: [MoviePopularResponse]?) -> [MoviePopular] {
        var data = [MoviePopular]()
        
        listMoviePopularResponse?.forEach { moviePopularResponse in
            data.append(
                MoviePopular(
                    id: moviePopularResponse.id.onNull(),
                    posterPath: "\(Constant.PRODUCTION_IMAGE_GATEWAY)\(moviePopularResponse.posterPath.onNull())",
                    title: moviePopularResponse.title.onNull(),
                    overview: moviePopularResponse.overview.onNull()
                )
            )
        }
        
        return data
    }
    
}
