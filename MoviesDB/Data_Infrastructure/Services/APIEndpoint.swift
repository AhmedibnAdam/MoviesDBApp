//
//  APIEndpoint.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import Foundation
import NetworkLayer

enum MoviesEndpoint: RequestProtocol {
    case getMoviesList(type: String)
    case getMovie(id: Int)
    
    var baseURL: URL {
        Configuration.shared.serverURL
    }
    
    var authToken: String?{
       nil
    }
    
    var apiToken: String?{
        Configuration.shared.apiKey
    }
    
    var path: String {
        switch self {

        case .getMoviesList(let type):
            return "\(type)"
        case .getMovie(id: let id):
            return "\(id)"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getMoviesList : return .get
        case .getMovie : return .get
        }
    }
    
    var headers: [String: String]? {
        return ["Accept": "application/json"]
    }
    
    var parameters: [String: Any]? {
        nil
    }
    
    var body: [String: Any]? {
        nil
    }
    
    var contentType: ContentType {
        return .json
    }
    
    var requiresAuthentication: Bool {
        return false
    }
    
    var timeoutInterval: TimeInterval {
        return 30
    }
    
    var cachePolicy: URLRequest.CachePolicy {
        return .useProtocolCachePolicy
    }
    
    var retryCount: Int {
        return 3
    }
}
