//
//  MovieListView.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftUI
import SwiftUI

struct MovieListView: View {
    @ObservedObject private var viewModel: MovieListViewModel

    init(viewModel: MovieListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        NavigationStack {
            VStack {
                if viewModel.isLoading {
                    ProgressView("Loading...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else if let errorMessage = viewModel.errorMessage {
                    VStack {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .multilineTextAlignment(.center)
                            .padding()
                        Button("Retry") {
                            Task {
                                await viewModel.fetchMovies()
                            }
                        }
                        .buttonStyle(.bordered)
                    }
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: viewModel.navigateToMovieDetail(movieId: movie.id)) {
                            HStack {
                                AsyncImage(url: movie.posterURL) { image in
                                    image.resizable()
                                } placeholder: {
                                    Color.gray
                                }
                                .frame(width: 50, height: 75)
                                .cornerRadius(8)

                                VStack(alignment: .leading) {
                                    Text(movie.title)
                                        .font(.headline)
                                    Text("Release: \(movie.release_date)")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                }
                            }
                        }
                    }
                    .navigationTitle(viewModel.movieType.label.capitalized)
                }
            }
            .onAppear {
                Task {
                    await viewModel.fetchMovies()
                }
            }
        }
    }
}
