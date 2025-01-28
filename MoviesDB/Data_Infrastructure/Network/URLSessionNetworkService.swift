//
//  URLSessionNetworkService.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//
import Foundation

protocol NetworkService {
    func performRequest(endpoint: APIEndPoint) async throws -> Data
}

final class URLSessionNetworkService: NetworkService {
    
    // Default timeout for network requests.
    private let timeoutInterval: TimeInterval = 30
    
    func performRequest(endpoint: APIEndPoint) async throws -> Data {
        
        guard let url = URL(string: "\(Configuration.shared.serverURL)\(endpoint.path)?api_key=\(Configuration.shared.apiKey)") else {
            throw NetworkError.invalidURL
        }
        
        // Step 2: Create a URLRequest and configure the timeout.
        var request = URLRequest(url: url)
        request.timeoutInterval = timeoutInterval
        

        // Step 3: Perform the network request.
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            
            // Step 4: Handle the HTTP response status code.
            guard let httpResponse = response as? HTTPURLResponse else {
                throw NetworkError.invalidResponse
            }

            switch httpResponse.statusCode {
            case 200:
                // Successful response.
                return data
            case 400...499:
                // Client-side errors (e.g., bad request, unauthorized).
                throw NetworkError.clientError(statusCode: httpResponse.statusCode)
            case 500...599:
                // Server-side errors.
                throw NetworkError.serverError(statusCode: httpResponse.statusCode)
            default:
                // Other unexpected HTTP status codes.
                throw NetworkError.unknownStatusCode(statusCode: httpResponse.statusCode)
            }
        } catch {
            // Step 5: Catch network-related errors (e.g., connectivity issues, timeouts).
            throw NetworkError.networkFailure(error: error)
        }
    }
}

