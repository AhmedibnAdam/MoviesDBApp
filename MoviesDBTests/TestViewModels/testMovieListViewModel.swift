//
//  testMovieListViewModel.swift
//  MoviesDBTests
//
//  Created by Ahmad on 28/01/2025.
//

import XCTest
import Combine
@testable import MoviesDB


@MainActor
final class MovieListViewModelTests: XCTestCase {
    
    var viewModel: MovieListViewModel!
    var mockFetchMoviesUseCase: MockFetchMoviesUseCase!
    var mockCoordinator: MockMovieListCoordinator!
    
    override func setUp() {
        super.setUp()
        mockFetchMoviesUseCase = MockFetchMoviesUseCase(result: .success([]))
        mockCoordinator = MockMovieListCoordinator(movieType: .nowPlaying)
        viewModel = MovieListViewModel(
            fetchMoviesUseCase: mockFetchMoviesUseCase,
            coordinator: mockCoordinator,
            movieType: .nowPlaying
        )
    }
    
    override func tearDown() {
        viewModel = nil
        mockFetchMoviesUseCase = nil
        mockCoordinator = nil
        super.tearDown()
    }
    
    func testFetchMovies_Success() async {
        // Given
        let expectedMovies: [MoviesDB.Movie] = [
            MoviesDB.Movie(
                    id: 1,
                    title: "Movie 1",
                    release_date: "2023-01-01",
                    poster_path: "/poster1.jpg",
                    overview: "Overview of Movie 1",
                    genres:  [MoviesDB.Genre(id: 1, name: "ahmed")],
                    runtime: 120
                ),
            MoviesDB.Movie(
                    id: 2,
                    title: "Movie 2",
                    release_date: "2023-02-01",
                    poster_path: "/poster2.jpg",
                    overview: "Overview of Movie 2",
                    genres: [MoviesDB.Genre(id: 2, name: "Adaam")],
                    runtime: 90
                )
            ]
        mockFetchMoviesUseCase.result = .success(expectedMovies)
        
        // When
        await viewModel.fetchMovies()
        
        // Then
        XCTAssertNil(viewModel.errorMessage, "errorMessage  nil on success")
    }
    
    func testFetchMovies_Failure() async {
        // Given
        mockFetchMoviesUseCase.result = .failure(NetworkError.invalidResponse)
        
        // When
        await viewModel.fetchMovies()
        
        // Then
        XCTAssertNotNil(viewModel.errorMessage, "errorMessage  not be nil on failure")
        XCTAssertTrue(viewModel.movies.isEmpty, "Movies should be empty when failure")
    }
    
    func testNavigateToMovieDetail() {
        // Given
        let movieId = 1
        
        // When
        _ = viewModel.navigateToMovieDetail(movieId: movieId)
        
        // Then
        XCTAssertEqual(mockCoordinator.navigatedToMovieId, movieId, "Coordinator should navigate to the correct movie")
    }
}
