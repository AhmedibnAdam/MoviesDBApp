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
    
    private let movieRepository: MockMovieService = MockMovieService()
    func execute(params: MoviesEntity.MoviesListRequestModel?) async throws -> [Movie] {
        guard let type = params?.movieType.rawValue  else { return [] }

        return try await movieRepository.fetchMovies(type: type)
    }

}


