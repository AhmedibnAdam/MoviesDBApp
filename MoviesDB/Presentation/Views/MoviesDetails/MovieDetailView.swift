//
//  MovieDetailView.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftUI

struct MovieDetailView: View {
    @StateObject private var viewModel: MovieDetailViewModel
    init(viewModel: MovieDetailViewModel) {
          _viewModel = StateObject(wrappedValue: viewModel)
      }

      var body: some View {
          VStack {
              if let movie = viewModel.movie {
                  MoviePosterView(url: movie.posterURL)
                      .frame(maxHeight: 300)

                  MovieDetailTitleView(title: movie.title)
                  MovieGenresView(genres: movie.genres)
                  MovieRuntimeView(runtime: movie.runtime)
                  MovieOverviewView(overview: movie.overview)
                  
                  Spacer()
              } else if viewModel.isLoading {
                  ProgressView("Loading movie details...")
              } else if let errorMessage = viewModel.errorMessage {
                  ErrorView(errorMessage: errorMessage) {
                      Task {
                          await viewModel.fetchMovieDetails()
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



 





