//
//  MovieUseCase.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import RxCocoa

protocol MovieUseCase {
    
    func getListPopular(request: MoviePopularRequest) -> BehaviorRelay<AppResult<[MoviePopular]>>
    
}
