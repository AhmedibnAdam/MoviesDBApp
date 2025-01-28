//
//  CoordinatorTests.swift
//  MoviesDB
//
//  Created by Ahmad on 29/01/2025.
//


import XCTest
import SwiftUI
@testable import MoviesDB

@MainActor
final class CoordinatorTests: XCTestCase {

    func testAppCoordinatorStart() {
        // Arrange
        let appCoordinator = AppCoordinator(initialMovieType: .nowPlaying)

        // Act
        let result = appCoordinator.eraseToAnyView()

        // Assert
        XCTAssertNotNil(result)
    }

    func testHomeViewCoordinatorStart() {
        // Arrange
        let homeViewCoordinator = HomeViewCoordinator()

        // Act
        let result = homeViewCoordinator.eraseToAnyView()

        // Assert
        XCTAssertNotNil(result)
    }

    func testHomeViewCoordinatorNavigateToMovieDetail() {
        // Arrange
        let homeViewCoordinator = HomeViewCoordinator()
        let movieId = 123

        // Act
        let result = homeViewCoordinator.navigateToMovieDetail(movieId: movieId)

        // Assert
        XCTAssertNotNil(result)
    }

    func testMovieDetailCoordinatorStart() {
        // Arrange
        let movieId = 123
        let movieDetailCoordinator = MovieDetailCoordinator(movieId: movieId)

        // Act
        let result = movieDetailCoordinator.eraseToAnyView()

        // Assert
        XCTAssertNotNil(result)
    }
}
