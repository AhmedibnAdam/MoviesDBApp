//
//  MovieRuntimeView.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

struct MovieRuntimeView: View {
    let runtime: Int?
    
    var body: some View {
        Text("Runtime: \(runtime ?? 0) mins")
            .font(.subheadline)
            .foregroundColor(.secondary)
    }
}
