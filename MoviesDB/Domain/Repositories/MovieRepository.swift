//
//  MovieRepository.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

protocol MovieRepository {
    func fetchMovies(type: String) async throws -> [Movie]
    func fetchMovieDetails(id: Int) async throws -> Movie
}

class MovieRepositoryImpl: MovieRepository {
    private let movieService: MovieService

    init(movieService: MovieService) {
        self.movieService = movieService
    }

    func fetchMovies(type: String) async throws -> [Movie] {
        do {
            return try await movieService.fetchMovies(type: type)
        } catch {
            throw self.mapError(error)
        }
    }

    func fetchMovieDetails(id: Int) async throws -> Movie {
        do {
            return try await movieService.fetchMovieDetails(id: id)
        } catch {
            throw self.mapError(error)
        }
    }

    private func mapError(_ error: Error) -> NetworkError {
        return .invalidURL // You can add more specific error mapping here if necessary
    }
}
