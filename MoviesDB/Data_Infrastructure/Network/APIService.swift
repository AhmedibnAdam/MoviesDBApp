//
//  APIService.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

// MARK: - Abstractions
protocol MovieService {
    func fetchMovies(type: String) async throws -> [Movie]
    func fetchMovieDetails(id: Int) async throws -> Movie
}

final class TMDBMovieService: MovieService {
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func fetchMovies(type: String) async throws -> [Movie] {
        let data = try await networkService.performRequest(endpoint: MoviesEndpoint.getMoviesList(type: type))
        let movieResponse = try JSONDecoder().decode(MoviesEntity.MovieResponse.self, from: data)
        return movieResponse.results
    }
    
    func fetchMovieDetails(id: Int) async throws -> Movie {
        let data = try await networkService.performRequest(endpoint: MoviesEndpoint.getMovie(id: id))
        let movie = try JSONDecoder().decode(Movie.self, from: data)
        return movie
    }
}
