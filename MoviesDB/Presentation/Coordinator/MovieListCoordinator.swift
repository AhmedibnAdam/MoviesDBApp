//
//  MovieListCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


import SwiftUI

@MainActor
class MovieListCoordinator: Coordinator {
    private let movieType: MovieType
    private let dependencies: DependencyContainer

    init(movieType: MovieType, dependencies: DependencyContainer) {
        self.movieType = movieType
        self.dependencies = dependencies
    }

    func start() -> some View {
        let fetchMovieListUseCase = FetchMoviesUseCase(dependencies: dependencies)
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMovieListUseCase, coordinator: self, movieType: movieType)
        return MovieListView(viewModel: viewModel)
    }

     func navigateToMovieDetail(movieId: Int) -> some View {
         let detailCoordinator = MovieDetailCoordinator(movieId: movieId, dependencies: dependencies)
        return detailCoordinator.eraseToAnyView()
    }
}
