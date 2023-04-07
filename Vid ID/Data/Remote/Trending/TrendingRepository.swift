//
//  TrendingRepository.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxSwift
import Alamofire

protocol TrendingRepository {
    func getListTrending(request: TrendingRequest) -> Observable<AppResponse<[TrendingResponse]>>
}
