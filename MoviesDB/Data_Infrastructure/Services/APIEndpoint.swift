//
//  APIEndpoint.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import Foundation

typealias ImageFormData = (name: String?, data: Data?, extention: String)
typealias Parameters = [String: Any]

protocol APIEndPoint{
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: Parameters? { get }
    var image: ImageFormData? { get }
}

enum MoviesEndpoint:  APIEndPoint{
    
    case getMoviesList(type: String)

    case getMovie(id: Int)

    // MARK: - HTTPMethod
    var method: HTTPMethod {
        switch self {
        case .getMoviesList : return .get
        case .getMovie : return .get
        }
    }

    // MARK: - Path
    var path: String {
        switch self {

        case .getMoviesList(let type):
            return "\(type)"
        case .getMovie(id: let id):
            return "\(id)"
        }
    }

    // MARK: - Parameters
    var parameters: Parameters? {
        switch self {
        default: return nil
        }
    }

    var image: ImageFormData? {
        switch self {
        default: return nil
        }
    }
}


