//
//  HomeViewCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import Foundation
import SwiftUI

@MainActor
final class HomeViewCoordinator: Coordinator {

    func start() -> some View {
        let viewModel = HomeViewModel(selectedMovieType: .nowPlaying, coordinator: self)
        return HomeView(viewModel: viewModel)
    }

     func navigateToMovieDetail(movieId: Int) -> some View {
        let detailCoordinator = MovieDetailCoordinator(movieId: movieId)
        return detailCoordinator.eraseToAnyView()
    }
}
