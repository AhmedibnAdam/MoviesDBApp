//
//  DefaultResponseHandler.swift
//  MoviesDB
//
//  Created by Ahmad on 05/02/2025.
//

import Foundation

protocol ResponseHandler {
    func handleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T
}

final class DefaultResponseHandler: ResponseHandler {
    func handleResponse<T: Decodable>(data: Data, response: URLResponse) throws -> T {
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.invalidResponse
        }
        
        guard (200...299).contains(httpResponse.statusCode) else {
            if httpResponse.statusCode == 401 {
                throw NetworkError.authenticationFailed
            } else {
                throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            }
        }
        
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingError(error)
        }
    }
}
