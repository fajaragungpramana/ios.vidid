//
//  SeriesUseCase.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import RxCocoa

protocol SeriesUseCase {
    func getListPopular(request: SeriesPopularRequest) -> BehaviorRelay<AppResult<[SeriesPopular]>>
}
