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
    @Injected private var mDisposeBag: DisposeBag
    
    @Published private var mListTrendingLoading: Bool = false
    @Published private var mListTrendingData: [Trending] = []
    @Published private var mListTrendingError: String = ""
    
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
    
    func getListTrendingLoading() -> Bool {
        return self.mListTrendingLoading
    }
    
    func getListTrendingData() -> [Trending] {
        return self.mListTrendingData
    }
    
    func getListTrendingError() -> String {
        return self.mListTrendingError
    }
    
}
