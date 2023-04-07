//
//  TrendingService.swift
//  Vid ID
//
//  Created by Fajar Agung Pramana on 07/04/23.
//

import Foundation
import Alamofire

enum TrendingService : URLRequestConvertible {
    
    case getListTrending(params: Parameters)
    
    var method: HTTPMethod {
        switch self {
        case .getListTrending:
            return .get
        }
    }
        
    var path: String {
        switch self {
        case .getListTrending(let params):
            return "trending/\(String(describing: params["media_type"]))/\(String(describing: params["time_window"]))"
        }
    }
        
    var parameter: Parameters {
        switch self {
        case .getListTrending(let params):
            return params
        }
    }
        
    func asURLRequest() throws -> URLRequest {
        let url = try Constant.PRODUCTION_GATEWAY.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        urlRequest.url?.append(queryItems: [URLQueryItem(name: "key", value: Constant.KEY_GATEWAY)])
            
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
