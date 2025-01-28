//
//  MovieDetailView.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel

    init( viewModel: MovieDetailViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if let movie = viewModel.movie {
                AsyncImage(url: movie.posterURL) { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                } placeholder: {
                    Color.gray
                }
                .frame(maxHeight: 300)

                Text(movie.title)
                    .font(.title)
                    .bold()

                Text("Genres: \(movie.genres?.map { $0.name }.joined(separator: ", ") ?? "N/A")")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text("Runtime: \(movie.runtime ?? 0) mins")
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(movie.overview ?? "No overview available")
                    .padding()

                Spacer()
            } else if viewModel.isLoading {
                ProgressView("Loading movie details...")
            } else if let errorMessage = viewModel.errorMessage {
                VStack {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                    Button("Retry") {
                        Task {
                            await viewModel.fetchMovieDetails()
                        }
                    }
                }
            }
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            Task {
                await viewModel.fetchMovieDetails()
            }
        }
    }
}
