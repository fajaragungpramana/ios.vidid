//
//  MovieService.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 09/04/23.
//

import Foundation
import Alamofire

enum MovieService : URLRequestConvertible {
    
    case getListPopular(params: Parameters)

    var method: HTTPMethod {
        switch self {
        case .getListPopular:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .getListPopular:
            return "movie/popular"
        }
    }
    
    var parameter: Parameters {
        switch self {
        case .getListPopular(let params):
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.PRODUCTION_GATEWAY.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.url?.append(queryItems: [URLQueryItem(name: "api_key", value: Constant.KEY_GATEWAY)])
        
        let encoding: ParameterEncoding = {
            switch method {
            case .get:
                return URLEncoding.default
            default:
                return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(urlRequest, with: parameter)
    }
    
}
