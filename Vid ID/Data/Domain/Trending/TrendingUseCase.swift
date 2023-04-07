//
//  TrendingUseCase.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxCocoa

protocol TrendingUseCase {
    func getListTrending(request: TrendingRequest) -> BehaviorRelay<AppResult<[Trending]>>
}
