//
//  MovieListViewModel.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import Foundation
import SwiftUI
import NetworkLayer

@MainActor
final class MovieListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let fetchMoviesUseCase: FetchMoviesUseCaseProtocol
    private let coordinator: MovieListCoordinator

    
    @Published var movies: [MoviesEntity.Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let movieType: MovieType

    // MARK: - Initialization
    init(fetchMoviesUseCase: FetchMoviesUseCaseProtocol, coordinator: MovieListCoordinator, movieType: MovieType) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.coordinator = coordinator
        self.movieType = movieType
    }
    
    // MARK: - Methods
    func fetchMovies() async {
        isLoading = true
        defer {
            isLoading = false
            errorMessage = nil
        }
        
        do {
            movies = try await fetchMoviesUseCase.execute(params: MoviesEntity.MoviesListRequestModel(movieType: movieType))
        } catch let error as NetworkError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unexpected error "
        }
        
    }
    
    func clearData() async {
        do {
            try await fetchMoviesUseCase.clearData(id:  "")
            self.movies = []
        } catch {
            errorMessage = "An unexpected error "
        }
    }
    
    func navigateToMovieDetail(movieId: Int) -> some View {
        coordinator.navigateToMovieDetail(movieId: movieId)
    }
}
