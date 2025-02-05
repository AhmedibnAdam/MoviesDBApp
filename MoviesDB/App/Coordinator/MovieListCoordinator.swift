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

    init(movieType: MovieType) {
        self.movieType = movieType
    }

    func start() -> some View {
        let fetchMovieListUseCase = FetchMoviesUseCase()
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMovieListUseCase, coordinator: self, movieType: movieType)
        return MovieListView(viewModel: viewModel)
    }

     func navigateToMovieDetail(movieId: Int) -> some View {
        let detailCoordinator = MovieDetailCoordinator(movieId: movieId)
        return detailCoordinator.eraseToAnyView()
    }
}
