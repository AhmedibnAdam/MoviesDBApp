//
//  FetchMoviesUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

protocol FetchMoviesUseCaseProtocol {
    func execute(params: BaseModel?) async throws -> [MoviesEntity.Movie]
}
    
class FetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    private let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol = MovieRepository()) {
        self.movieRepository = movieRepository
    }

    func execute(params: BaseModel?) async throws -> [MoviesEntity.Movie] {
        guard let parameters = params as? MoviesEntity.MoviesListRequestModel else { return [] }

        return try await movieRepository.fetchMovies(type: parameters.movieType.rawValue)
    }
}
