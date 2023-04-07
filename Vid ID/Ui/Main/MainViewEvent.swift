//
//  MainViewEvent.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import Alamofire

protocol IMainViewEvent {
    func getListTrending(request: TrendingRequest)
}

enum MainViewEvent {
    case OnLoadingGetListTrending(Bool)
    case OnSuccessGetListTrending([Trending])
    case OnFailureGetListTrending(Error)
}
