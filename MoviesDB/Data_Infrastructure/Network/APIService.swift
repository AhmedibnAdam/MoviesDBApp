//
//  APIService.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

// MARK: - Abstractions
protocol MovieService {
    func fetchMovies(endpoint: String) async throws -> [Movie]
    func fetchMovieDetails(movieId: Int) async throws -> Movie
}

final class TMDBMovieService: MovieService {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMovies(endpoint: String) async throws -> [Movie] {
        let data = try await networkService.performRequest(endpoint: "/movie/\(endpoint)")
        let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
        return movieResponse.results
    }
    
    func fetchMovieDetails(movieId: Int) async throws -> Movie {
        let data = try await networkService.performRequest(endpoint: "/movie/\(movieId)")
        let movie = try JSONDecoder().decode(Movie.self, from: data)
        return movie
    }
}
