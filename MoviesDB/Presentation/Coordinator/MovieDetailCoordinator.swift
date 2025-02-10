//
//  MovieDetailCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

final class MovieDetailCoordinator: Coordinator {
    private let movieId: Int
    private let dependencies: DependencyContainer

    init(movieId: Int, dependencies: DependencyContainer) {
        self.movieId = movieId
        self.dependencies = dependencies
    }

    func start() -> some View {
      
        let fetchMovieDetailsUseCase = FetchMovieDetailsUseCase(dependencies: dependencies)
        let viewModel = MovieDetailViewModel(movieId: movieId, fetchMovieDetailsUseCase: fetchMovieDetailsUseCase)
        return MovieDetailView(viewModel: viewModel)
    }
}
