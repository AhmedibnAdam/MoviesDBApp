//
//  MockFetchMoviesUseCase.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import XCTest
import Combine
@testable import MoviesDB

class MockFetchMoviesUseCase: FetchMoviesUseCase {
    
    private let movieRepository: MockMovieService

    init(mockedMovieRepository: MockMovieService) {
        self.movieRepository = mockedMovieRepository
    }

    func execute(params: BaseModel?) async throws -> [Movie] {
        guard let parameters = params as? MoviesEntity.MoviesListRequestModel else {
            return []
        }
        return try await movieRepository.fetchMovies(type: parameters.movieType.rawValue)
    }

}



