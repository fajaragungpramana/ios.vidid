//
//  MainViewModel.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxSwift
import RxCocoa

class MainViewModel : ObservableObject, IMainViewEvent {
    
    @Injected private var mTrendingUseCase: TrendingUseCase
    @Injected private var mDisposeBag: DisposeBag

    private let mMainViewState = BehaviorRelay<MainViewEvent>(value: .OnLoadingGetListTrending(false))
    
    func getMainViewState() -> BehaviorRelay<MainViewEvent> {
        return self.mMainViewState
    }
    
    func getListTrending(request: TrendingRequest) {
        self.mTrendingUseCase.getListTrending(request: request).subscribe { event in
            let state = event.element
            
            switch state {
            case .OnLoading(let isLoading):
                self.mMainViewState.accept(.OnLoadingGetListTrending(isLoading))
            case .OnSuccess(let data):
                self.mMainViewState.accept(.OnSuccessGetListTrending(data))
            case .OnFailure(let error):
                self.mMainViewState.accept(.OnFailureGetListTrending(error))
                
            default:
                break
            }
            
        }.disposed(by: self.mDisposeBag)
    }
    
}
