//
//  FetchMoviesUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

protocol BaseModel: Codable {
}


protocol FetchMoviesUseCase {
    func execute(params: BaseModel?) async throws -> [Movie]
}

class FetchMoviesUseCaseImpl: FetchMoviesUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(params: BaseModel?) async throws -> [Movie] {
        guard let parameters = params as? MoviesEntity.MoviesListRequestModel else { return [] }

        return try await movieRepository.fetchMovies(type: parameters.movieType.rawValue)
    }
}
