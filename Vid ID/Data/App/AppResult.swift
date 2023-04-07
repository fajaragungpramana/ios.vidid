//
//  AppResult.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import Alamofire

enum AppResult<T> {
    case OnLoading(Bool)
    case OnSuccess(T)
    case OnFailure(Error)
}
