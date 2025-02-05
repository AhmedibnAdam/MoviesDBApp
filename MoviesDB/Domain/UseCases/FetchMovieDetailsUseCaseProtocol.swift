//
//  FetchMovieDetailsUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


protocol FetchMovieDetailsUseCaseProtocol {
    func execute(params: BaseModel?) async throws -> MoviesEntity.Movie?
}


class FetchMovieDetailsUseCaseImpl: FetchMovieDetailsUseCaseProtocol {
    private let movieRepository: MovieRepositoryProtocol

    init(movieRepository: MovieRepositoryProtocol) {
        self.movieRepository = movieRepository
    }

    func execute(params: BaseModel?) async throws -> MoviesEntity.Movie? {
        guard let parameters = params as? MoviesEntity.MoviesDetailsRequestModel else { return nil }

        return try await movieRepository.fetchMovieDetails(id: parameters.id)
    }
}
