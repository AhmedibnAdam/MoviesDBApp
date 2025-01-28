//
//  testHomeViewModel.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import XCTest
@testable import MoviesDB


class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    var mockCoordinator: AppCoordinator!
    
    @MainActor
    override func setUp() {
        super.setUp()
        // Initialize the mock coordinator and view model
        mockCoordinator = AppCoordinator(initialMovieType: .popular)
        viewModel = HomeViewModel(selectedMovieType: .popular, coordinator: mockCoordinator)
    }

    override func tearDown() {
        // Clean up
        viewModel = nil
        mockCoordinator = nil
        super.tearDown()
    }

    func testUpdateSelectedMovieType() {
        // Given
        let newType: MovieType = .nowPlaying

        // When
        viewModel.updateSelectedMovieType(to: newType)

        // Then
        XCTAssertEqual(viewModel.selectedMovieType, newType, "The selectedMovieType should be updated correctly.")
    }
}
