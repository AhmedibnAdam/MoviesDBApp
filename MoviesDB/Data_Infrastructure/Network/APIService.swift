//
//  APIService.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation
import NetworkLayer

// MARK: - Abstractions
protocol MovieService {
    func fetchMovies(type: String) async throws -> [MoviesEntity.Movie]
    func fetchMovieDetails(id: Int) async throws -> MoviesEntity.Movie
}

final class TMDBMovieService: MovieService {
    
    func fetchMovies(type: String) async throws -> [MoviesEntity.Movie] {
        let request = MoviesEndpoint.getMoviesList(type: type)
        let data: MoviesEntity.MovieResponse = try await NetworkService.shared.request(request)
        return data.results
    }
    
    func fetchMovieDetails(id: Int) async throws -> MoviesEntity.Movie {
        let request = MoviesEndpoint.getMovie(id: id)
        let data: MoviesEntity.Movie = try await NetworkService.shared.request(request)
        return data
    }
}
