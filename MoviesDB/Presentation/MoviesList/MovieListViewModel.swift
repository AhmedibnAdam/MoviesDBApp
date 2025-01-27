//
//  MovieListViewModel.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import Foundation
import SwiftUI

class MovieListViewModel: ObservableObject {
    private let fetchMoviesUseCase: FetchMoviesUseCase

    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    let movieType: MovieType


    init(fetchMoviesUseCase: FetchMoviesUseCase, movieType: MovieType) {
        self.fetchMoviesUseCase = fetchMoviesUseCase
        self.movieType = movieType
    }

    func fetchMovies() async {
        do {
            // Fetch the movies in the background
            let fetchedMovies = try await fetchMoviesUseCase.execute(endpoint: movieType.rawValue)

            // Update the UI on the main thread
            DispatchQueue.main.async {
                self.movies = fetchedMovies
                self.isLoading = false
            }
        } catch let error as NetworkError {
            DispatchQueue.main.async {
                self.errorMessage = error.localizedDescription
                self.isLoading = false
            }
        } catch {
            DispatchQueue.main.async {
                self.errorMessage = NetworkError.invalidResponse.localizedDescription
                self.isLoading = false
            }
        }
    }
}

