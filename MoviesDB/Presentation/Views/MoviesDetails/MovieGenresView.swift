//
//  MovieGenresView.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

struct MovieGenresView: View {
    let genres: [MoviesEntity.Genre]?
    
    var body: some View {
        Text("Genres: \(genres?.map { $0.name }.joined(separator: ", ") ?? "N/A")")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}
