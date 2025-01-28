//
//  MockMovieService.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import XCTest
import Combine
@testable import MoviesDB

class MockMovieService: MovieService {

    
    var shouldThrowError = false
    var movies: [Movie] = [
        Movie(
                id: 1,
                title: "Movie 1",
                release_date: "2023-01-01",
                poster_path: "/poster1.jpg",
                overview: "Overview of Movie 1",
                genres:  [Genre(id: 1, name: "ahmed")],
                runtime: 120
            ),
        Movie(
                id: 2,
                title: "Movie 2",
                release_date: "2023-02-01",
                poster_path: "/poster2.jpg",
                overview: "Overview of Movie 2",
                genres: [Genre(id: 2, name: "Adaam")],
                runtime: 90
            )
        ]
    var movieDetails: Movie?

    func fetchMovies(type: String) async throws -> [Movie] {
        if shouldThrowError {
            throw NetworkError.invalidURL // Simulated error
        }
        return movies
    }

    func fetchMovieDetails(id: Int) async throws -> Movie {
        if shouldThrowError {
            throw NetworkError.invalidURL
        }
        guard let movie = movieDetails else {
            throw NetworkError.invalidURL 
        }
        return movie
    }
}
