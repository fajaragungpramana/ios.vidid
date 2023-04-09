//
//  MainViewModel.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel : ObservableObject, MainViewEvent {
 
    @Injected private var mTrendingUseCase: TrendingUseCase
    @Injected private var mSeriesUseCase: SeriesUseCase
    @Injected private var mMovieUseCase: MovieUseCase
    
    @Injected private var mDisposeBag: DisposeBag
    
    // MARK: Trending
    @Published private var mListTrendingLoading: Bool = false
    @Published private var mListTrendingData: [Trending] = []
    @Published private var mListTrendingError: String = ""
    
    // MARK: Series
    @Published private var mListSeriesPopularLoading: Bool = false
    @Published private var mListSeriesPopularData: [SeriesPopular] = []
    @Published private var mListSeriesPopularError: String = ""
    
    // MARK: Movies
    @Published private var mListMoviePopularLoading: Bool = false
    @Published private var mListMoviePopularData: [MoviePopular] = []
    @Published private var mListMoviePopularError: String = ""
    
    func getListTrending(request: TrendingRequest) {
        self.mTrendingUseCase.getListTrending(request: request).subscribe { event in
            let state = event.element
            
            switch state {
            case .OnLoading(let isLoading):
                self.mListTrendingLoading = isLoading
            case .OnSuccess(let data):
                self.mListTrendingData = data
            case .OnFailure(let error):
                self.mListTrendingError = error.localizedDescription
                
            default:
                break
            }
            
        }.disposed(by: self.mDisposeBag)
    }
    
    func getListSeriesPopular(request: SeriesPopularRequest) {
        self.mSeriesUseCase.getListPopular(request: request).subscribe { event in
            let state = event.element
            
            switch state {
            case .OnLoading(let isLoading):
                self.mListSeriesPopularLoading = isLoading
            case .OnSuccess(let data):
                self.mListSeriesPopularData = data
            case .OnFailure(let error):
                self.mListSeriesPopularError = error.localizedDescription
                
            default:
                break
            }
            
        }.disposed(by: self.mDisposeBag)
    }
    
    func getListMoviePopular(request: MoviePopularRequest) {
        self.mMovieUseCase.getListPopular(request: request).subscribe { event in
            let state = event.element
            
            switch state {
            case .OnLoading(let isLoading):
                self.mListMoviePopularLoading = isLoading
            case .OnSuccess(let data):
                self.mListMoviePopularData = data
            case .OnFailure(let error):
                self.mListMoviePopularError = error.localizedDescription
                
            default:
                break
            }
            
        }.disposed(by: self.mDisposeBag)
    }
    
    // MARK: Trending State
    func getListTrendingLoading() -> Bool {
        return self.mListTrendingLoading
    }
    
    func getListTrendingData() -> [Trending] {
        return self.mListTrendingData
    }
    
    func getListTrendingError() -> String {
        return self.mListTrendingError
    }
    
    // MARK: Series Popular State
    func getListSeriesPopularLoading() -> Bool {
        return self.mListSeriesPopularLoading
    }
    
    func getListSeriesPopularData() -> [SeriesPopular] {
        return self.mListSeriesPopularData
    }
    
    func getListSeriesPopularError() -> String {
        return self.mListSeriesPopularError
    }
    
    // MARK: Movie Popular State
    func getListMoviePopularLoading() -> Bool {
        return self.mListMoviePopularLoading
    }
    
    func getListMoviePopularData() -> [MoviePopular] {
        return self.mListMoviePopularData
    }
    
    func getListMoviePopularError() -> String {
        return self.mListMoviePopularError
    }
    
}
