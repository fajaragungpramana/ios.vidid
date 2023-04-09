//
//  AppInjection.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import Swinject
import RxSwift

final class Injection {
    
    static let shared = Injection()
    
    private var _container: Container?
    
    var container: Container {
        get {
            if _container == nil {
                _container = buildContainer()
            }
            return _container!
        }
        set {
            _container = newValue
        }
    }
    
    private func buildContainer() -> Container {
        let container = Container()
        // Common
        container.register(DisposeBag.self) { _ in DisposeBag() }
        container.register(AppClient.self) { _ in AppClient() }
        
        // Repository
        container.register(TrendingRepository.self) { r in
            TrendingRepositoryImpl(appCLient: r.resolve(AppClient.self)!)
        }
        container.register(SeriesRepository.self) { r in
            SeriesRepositoryImpl(appCLient: r.resolve(AppClient.self)!)
        }
        container.register(MovieRepository.self) { r in
            MovieRepositoryImpl(appCLient: r.resolve(AppClient.self)!)
        }
        
        // Domain
        container.register(TrendingUseCase.self) { r in
            TrendingInteractor(
                trendingRepository: r.resolve(TrendingRepository.self)!,
                disposeBag: r.resolve(DisposeBag.self)!
            )
        }
        container.register(SeriesUseCase.self) { r in
            SeriesInteractor(
                seriesRepository: r.resolve(SeriesRepository.self)!,
                disposeBag: r.resolve(DisposeBag.self)!
            )
        }
        container.register(MovieUseCase.self) { r in
            MovieInteractor(
                movieRepository: r.resolve(MovieRepository.self)!,
                disposeBag: r.resolve(DisposeBag.self)!
            )
        }
        
        return container
    }
    
}

@propertyWrapper struct Injected<Dependency> {
    let wrappedValue: Dependency
    
    init() {
        self.wrappedValue = Injection.shared.container.resolve(Dependency.self)!
    }
}
