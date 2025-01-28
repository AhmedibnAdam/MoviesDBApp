//
//  MockMovieListCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


import XCTest
import Combine
@testable import MoviesDB
import SwiftUICore


class MockMovieListCoordinator: MovieListCoordinator {
    var navigatedToMovieId: Int?
    
    func navigateToMovieDetail(movieId: Int) -> some View {
        navigatedToMovieId = movieId
        return EmptyView()
    }
}
