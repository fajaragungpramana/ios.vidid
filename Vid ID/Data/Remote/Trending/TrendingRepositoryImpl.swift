//
//  TrendingRepositoryImpl.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxSwift
import Alamofire

class TrendingRepositoryImpl : TrendingRepository {
    
    private var mAppClient: AppClient
    
    init(appCLient: AppClient) {
        self.mAppClient = appCLient
    }
    
    func getListTrending(request: TrendingRequest) -> Observable<AppResponse<[TrendingResponse]>> {
        mAppClient.request(TrendingService.getListTrending(params: request.toRequest()))
    }
    
}
