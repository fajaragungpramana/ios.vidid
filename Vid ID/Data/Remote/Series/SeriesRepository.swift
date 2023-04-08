//
//  SeriesRepository.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import RxSwift

protocol SeriesRepository {
    func getListPopular(request: SeriesPopularRequest) -> Observable<AppResponse<[SeriesPopularResponse]>>
}
