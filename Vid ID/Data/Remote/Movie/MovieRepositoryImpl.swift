//
//  MovieRepositoryImpl.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import RxSwift

class MovieRepositoryImpl : MovieRepository {
    
    private var mAppClient: AppClient
    
    init(appCLient: AppClient) {
        self.mAppClient = appCLient
    }
    
    func getListPopular(request: MoviePopularRequest) -> Observable<AppResponse<[MoviePopularResponse]>> {
        return self.mAppClient.request(MovieService.getListPopular(params: request.toRequest()))
    }
    
}
