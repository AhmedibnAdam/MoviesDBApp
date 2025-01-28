//
//  MovieListViewModel.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import Foundation
import SwiftUI

@MainActor
final class MovieListViewModel: ObservableObject {
    
    // MARK: - Properties
    private let fetchMoviesUseCase: FetchMoviesUseCase
    private let coordinator: MovieListCoordinator
    
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String?
    
    let movieType: MovieType

    // MARK: - Initialization
    init(fetchMoviesUseCase: FetchMoviesUseCase, coordinator: MovieListCoordinator, movieType: MovieType) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.coordinator = coordinator
        self.movieType = movieType
    }
    
    // MARK: - Methods
    func fetchMovies() async {
        isLoading = true
        errorMessage = nil
        
        do {
            movies = try await fetchMoviesUseCase.execute(params: MoviesEntity.MoviesListRequestModel(movieType: movieType))
        } catch let error as NetworkError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = "An unexpected error "
        }
        
        isLoading = false
    }
    
    func navigateToMovieDetail(movieId: Int) -> some View {
        coordinator.navigateToMovieDetail(movieId: movieId)
    }
}
