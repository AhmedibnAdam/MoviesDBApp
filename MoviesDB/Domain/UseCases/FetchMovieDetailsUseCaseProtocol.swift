//
//  FetchMovieDetailsUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


protocol FetchMovieDetailsUseCaseProtocol {
    func execute(params: BaseModel?) async throws -> MoviesEntity.Movie?
}

@MainActor
class FetchMovieDetailsUseCase: FetchMovieDetailsUseCaseProtocol {
    private let movieRepository: MovieServiceRepositoryProtocol

    init(dependencies: DependencyContainer) {
        self.movieRepository = TMDBMovieServiceRepository(network: dependencies.network,
                                                          cache: dependencies.cacheModule)
    }

    func execute(params: BaseModel?) async throws -> MoviesEntity.Movie? {
        guard let parameters = params as? MoviesEntity.MoviesDetailsRequestModel else { return nil }

        return try await movieRepository.fetchMovieDetails(id: parameters.id)
    }
}
