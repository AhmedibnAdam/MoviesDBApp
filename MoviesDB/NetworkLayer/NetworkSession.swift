//
//  NetworkSession.swift
//  MoviesDB
//
//  Created by Ahmad on 05/02/2025.
//

import Foundation

protocol NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

final class URLSessionDispatcher: NetworkSession {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        try await URLSession.shared.data(for: request)
    }
}
