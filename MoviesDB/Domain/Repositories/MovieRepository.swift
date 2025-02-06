//
//  MovieRepository.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import Foundation

// MARK: - Abstractions
protocol MovieServiceRepositoryProtocol {
    func fetchMovies(type: String) async throws -> [MoviesEntity.Movie]
    func fetchMovieDetails(id: Int) async throws -> MoviesEntity.Movie
    func clearUserData(id: String) async throws

}
