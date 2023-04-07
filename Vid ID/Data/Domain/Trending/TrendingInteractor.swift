//
//  TrendingInteractor.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxCocoa
import RxSwift

class TrendingInteractor : TrendingUseCase {
    
    private var mTrendingRepository : TrendingRepository
    private var mDisposeBag: DisposeBag
    
    init(trendingRepository: TrendingRepository, disposeBag: DisposeBag) {
        self.mTrendingRepository = trendingRepository
        self.mDisposeBag = disposeBag
    }
    
    func getListTrending(request: TrendingRequest) -> BehaviorRelay<AppResult<[Trending]>> {
        let result = BehaviorRelay<AppResult<[Trending]>>(value: .OnLoading(false))
        
        result.accept(.OnLoading(true))
        self.mTrendingRepository.getListTrending(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { data in
                result.accept(.OnLoading(false))
                result.accept(.OnSuccess(Trending.mapList(listTrendingResponse: data.results)))
            }, onError: { error in
                result.accept(.OnLoading(false))
                result.accept(.OnFailure(error))
            })
            .disposed(by: self.mDisposeBag)
        
        return result
    }
    
}
