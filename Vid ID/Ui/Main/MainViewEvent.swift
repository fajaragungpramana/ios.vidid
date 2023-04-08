//
//  MainViewEvent.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import Alamofire

protocol MainViewEvent {
    func getListTrending(request: TrendingRequest)
}
