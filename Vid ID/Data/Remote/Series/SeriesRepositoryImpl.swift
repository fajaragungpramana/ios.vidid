//
//  SeriesRepositoryImpl.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import RxSwift

class SeriesRepositoryImpl : SeriesRepository {
    
    private var mAppClient: AppClient
    
    init(appCLient: AppClient) {
        self.mAppClient = appCLient
    }
    
    func getListPopular(request: SeriesPopularRequest) -> Observable<AppResponse<[SeriesPopularResponse]>> {
        return self.mAppClient.request(SeriesService.getListPopular(params: request.toRequest()))
    }
    
}
