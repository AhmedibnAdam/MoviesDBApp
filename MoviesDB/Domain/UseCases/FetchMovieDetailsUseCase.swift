//
//  FetchMovieDetailsUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


protocol FetchMovieDetailsUseCase {
    func execute(params: BaseModel?) async throws -> Movie?
}


class FetchMovieDetailsUseCaseImpl: FetchMovieDetailsUseCase {
    private let movieRepository: MovieRepository

    init(movieRepository: MovieRepository) {
        self.movieRepository = movieRepository
    }

    func execute(params: BaseModel?) async throws -> Movie? {
        guard let parameters = params as? MoviesEntity.MoviesDetailsRequestModel else { return nil }

        return try await movieRepository.fetchMovieDetails(id: parameters.id)
    }
}
