//
//  MovieRepository.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import RxSwift

protocol MovieRepository {
    func getListPopular(request: MoviePopularRequest) -> Observable<AppResponse<[MoviePopularResponse]>>
}
