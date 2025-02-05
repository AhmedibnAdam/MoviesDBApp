//
//  MovieRepository.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

protocol MovieRepositoryProtocol {
    func fetchMovies(type: String) async throws -> [MoviesEntity.Movie]
    func fetchMovieDetails(id: Int) async throws -> MoviesEntity.Movie
}

class MovieRepository: MovieRepositoryProtocol {
    private let movieService: MovieService = TMDBMovieService()

    func fetchMovies(type: String) async throws -> [MoviesEntity.Movie] {
        do {
            return try await movieService.fetchMovies(type: type)
        } catch {
            throw self.mapError(error)
        }
    }

    func fetchMovieDetails(id: Int) async throws -> MoviesEntity.Movie {
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
