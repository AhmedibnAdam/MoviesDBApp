//
//  MovieListViewFactory.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

// MovieListViewFactory.swift
import Foundation

struct MovieListViewFactory {
    static func create(movieType: MovieType) -> MovieListView {
        let networkService = URLSessionNetworkService()
        let movieService = TMDBMovieService(networkService: networkService)
        let movieRepository = MovieRepositoryImpl(movieService: movieService)
        let fetchMoviesUseCase = FetchMoviesUseCaseImpl(movieRepository: movieRepository)
        let viewModel = MovieListViewModel(fetchMoviesUseCase: fetchMoviesUseCase, movieType: movieType)
        
        return MovieListView(viewModel: viewModel)
    }
}
