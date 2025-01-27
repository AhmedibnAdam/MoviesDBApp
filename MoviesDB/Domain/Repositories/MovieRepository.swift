//
//  MovieRepository.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

protocol MovieRepository {
    func fetchMovies(endpoint: String) async throws -> [Movie]
    func fetchMovieDetails(movieId: Int) async throws -> Movie
}

class MovieRepositoryImpl: MovieRepository {
    private let movieService: MovieService

    init(movieService: MovieService) {
        self.movieService = movieService
    }

    func fetchMovies(endpoint: String) async throws -> [Movie] {
        do {
            return try await movieService.fetchMovies(endpoint: endpoint)
        } catch {
            throw self.mapError(error)
        }
    }

    func fetchMovieDetails(movieId: Int) async throws -> Movie {
        do {
            return try await movieService.fetchMovieDetails(movieId: movieId)
        } catch {
            throw self.mapError(error)
        }
    }

    private func mapError(_ error: Error) -> NetworkError {
        return .invalidURL // You can add more specific error mapping here if necessary
    }
}
