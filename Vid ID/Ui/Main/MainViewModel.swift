//
//  MainViewModel.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import RxSwift

class MainViewModel : ObservableObject, IMainViewEvent {
    
    @Injected private var mTrendingUseCase: TrendingUseCase
    @Injected private var mDisposeBag: DisposeBag

    func getListTrending(request: TrendingRequest) {
        self.mTrendingUseCase.getListTrending(request: request).subscribe { event in
            let state = event.element
            
            switch state {
            case .OnLoading(let isLoading):
                print("Hello OnLoading : \(isLoading)")
            case .OnSuccess(let data):
                print("Hello OnSuccess : \(data)")
            case .OnFailure(let error):
                print("Hello OnFailure : \(error)")
                
            default:
                break
            }
            
        }.disposed(by: self.mDisposeBag)
    }
    
}
