//
//  MovieDetailViewModel.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


import Foundation
import SwiftUI

@MainActor
final class MovieDetailViewModel: ObservableObject {
    // MARK: - Published Properties
    let movieId: Int
    @Published var movie: Movie? = nil
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil

    // MARK: - Dependencies
    private let fetchMovieDetailsUseCase: FetchMovieDetailsUseCase

    // MARK: - Initialization
    init(movieId: Int, fetchMovieDetailsUseCase: FetchMovieDetailsUseCase) {
        self.movieId = movieId
        self.fetchMovieDetailsUseCase = fetchMovieDetailsUseCase
    }

    // MARK: - Methods
    func fetchMovieDetails() async {
        isLoading = true
        errorMessage = nil

        do {
            let fetchedMovie = try await fetchMovieDetailsUseCase.execute(params: MoviesEntity.MoviesDetailsRequestModel(id: movieId))
            self.movie = fetchedMovie
        } catch let error as NetworkError {
            errorMessage = error.localizedDescription
        } catch {
            errorMessage = NetworkError.invalidResponse.localizedDescription
        }

        isLoading = false
    }
}
