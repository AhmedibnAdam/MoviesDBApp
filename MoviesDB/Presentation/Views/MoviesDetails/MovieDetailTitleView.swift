//
//  MovieDetailTitleView.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

struct MovieDetailTitleView: View {
    let title: String

    var body: some View {
        Text(title)
            .font(.title)
            .bold()
    }
}
