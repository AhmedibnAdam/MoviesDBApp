//
//  MovieDetailView.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftUI

struct MovieDetailView: View {
    let movieId: Int
    @State private var movie: Movie?
    @State private var isLoading = true
    
    var body: some View {
        VStack {
            if let movie = movie {
                AsyncImage(url: movie.posterURL ) { image in
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
            } else if isLoading {
                ProgressView()
            } else {
                Text("Failed to load movie details.")
            }
        }
        .padding()
        .navigationTitle("Details")
        .onAppear {
            fetchMovieDetails()
        }
    }
    
    private func fetchMovieDetails() {
//          movieService.fetchMovies(endpoint: "popular") { result in
//            switch result {
//            case .success(let movies):
//                print("Fetched Movies: \(movies)")
//            case .failure(let error):
//                print("Error: \(error)")
//            }
//        }
    }
}
