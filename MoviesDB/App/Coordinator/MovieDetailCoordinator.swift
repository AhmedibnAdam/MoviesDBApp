//
//  MovieDetailCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

final class MovieDetailCoordinator: Coordinator {
    private let movieId: Int

    init(movieId: Int) {
        self.movieId = movieId
    }

    func start() -> some View {
      
        let fetchMovieDetailsUseCase = FetchMovieDetailsUseCase()
        let viewModel = MovieDetailViewModel(movieId: movieId, fetchMovieDetailsUseCase: fetchMovieDetailsUseCase)
        return MovieDetailView(viewModel: viewModel)
    }
}
