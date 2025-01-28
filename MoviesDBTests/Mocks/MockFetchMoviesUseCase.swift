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
    
    private let movieRepository: MovieRepository

    init(mockedMovieRepository: MockMovieRepository) {
        self.movieRepository = mockedMovieRepository
    }

    func execute(params: BaseModel?) async throws -> [Movie] {
        movieRepository.fetchMovies(type: "params.debugDescription")
    }

}

class MockMovieRepository: MovieRepository {
    
    // The mock result to return
    var result: Result<[Movie], Error>?
    
    func fetchMovies(type: String) async throws -> [Movie] {
        guard let result = result else {
            fatalError("MockMovieRepository result is not set.")
        }
        switch result {
        case .success(let movies):
            return movies
        case .failure(let error):
            throw error
        }
    }
    
    func fetchMovieDetails(id: Int) async throws -> Movie {
        guard let result = result else {
            fatalError("MockMovieRepository result is not set.")
        }
        switch result {
        case .success(let movies):
            return movies[id]
        case .failure(let error):
            throw error
        }
    }
    


}
