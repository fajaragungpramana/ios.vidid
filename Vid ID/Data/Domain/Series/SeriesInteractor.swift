//
//  SeriesInteractor.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 08/04/23.
//

import RxCocoa
import RxSwift

class SeriesInteractor : SeriesUseCase {
    
    private var mSeriesRepository : SeriesRepository
    private var mDisposeBag: DisposeBag
    
    init(seriesRepository: SeriesRepository, disposeBag: DisposeBag) {
        self.mSeriesRepository = seriesRepository
        self.mDisposeBag = disposeBag
    }
    
    func getListPopular(request: SeriesPopularRequest) -> BehaviorRelay<AppResult<[SeriesPopular]>> {
        let result = BehaviorRelay<AppResult<[SeriesPopular]>>(value: .OnLoading(false))
        
        result.accept(.OnLoading(true))
        self.mSeriesRepository.getListPopular(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { data in
                result.accept(.OnLoading(false))
                result.accept(.OnSuccess(SeriesPopular.mapList(listSeriesPopularResponse: data.results)))
            }, onError: { error in
                result.accept(.OnLoading(false))
                result.accept(.OnFailure(error))
            })
            .disposed(by: self.mDisposeBag)
        
        return result
    }
    
}
