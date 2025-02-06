//
//  FetchMoviesUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

protocol FetchMoviesUseCaseProtocol {
    func execute(params: BaseModel?) async throws -> [MoviesEntity.Movie]
    func clearData(id: String) async throws
}
  
@MainActor
class FetchMoviesUseCase: FetchMoviesUseCaseProtocol {
    
    
    private let movieRepository: MovieServiceRepositoryProtocol
    
    init(dependencies: DependencyContainer) {
        self.movieRepository = TMDBMovieServiceRepository(network: dependencies.network,
                                                          cache: dependencies.cacheModule)
    }

    func execute(params: BaseModel?) async throws -> [MoviesEntity.Movie] {
        guard let parameters = params as? MoviesEntity.MoviesListRequestModel else { return [] }

        return try await movieRepository.fetchMovies(type: parameters.movieType.rawValue)
    }
    
    func clearData(id: String) async throws {

       }
}
