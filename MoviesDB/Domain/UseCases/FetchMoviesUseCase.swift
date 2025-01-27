//
//  FetchMoviesUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


protocol FetchMoviesUseCase {
    func execute(endpoint: String) async throws -> [Movie]
}

class FetchMoviesUseCaseImpl: FetchMoviesUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(endpoint: String) async throws -> [Movie] {
        return try await movieRepository.fetchMovies(endpoint: endpoint)
    }
}

protocol FetchMovieDetailsUseCase {
    func execute(movieId: Int) async throws -> Movie
}

class FetchMovieDetailsUseCaseImpl: FetchMovieDetailsUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(movieId: Int) async throws -> Movie {
        return try await movieRepository.fetchMovieDetails(movieId: movieId)
    }
}
