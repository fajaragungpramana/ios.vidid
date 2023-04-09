//
//  MovieInteractor.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import RxCocoa
import RxSwift

class MovieInteractor : MovieUseCase {
    
    private var mMovieRepository : MovieRepository
    private var mDisposeBag: DisposeBag
    
    init(movieRepository: MovieRepository, disposeBag: DisposeBag) {
        self.mMovieRepository = movieRepository
        self.mDisposeBag = disposeBag
    }
    
    func getListPopular(request: MoviePopularRequest) -> BehaviorRelay<AppResult<[MoviePopular]>> {
        let result = BehaviorRelay<AppResult<[MoviePopular]>>(value: .OnLoading(false))
        
        result.accept(.OnLoading(true))
        self.mMovieRepository.getListPopular(request: request)
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { data in
                result.accept(.OnLoading(false))
                result.accept(.OnSuccess(MoviePopular.mapList(listMoviePopularResponse: data.results)))
            }, onError: { error in
                result.accept(.OnLoading(false))
                result.accept(.OnFailure(error))
            })
            .disposed(by: self.mDisposeBag)
        
        return result
    }
    
}
