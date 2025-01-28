//
//  MoviePosterView.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

  struct MoviePosterView: View {
      let url: URL?

      var body: some View {
          AsyncImage(url: url) { image in
              image.resizable()
                  .aspectRatio(contentMode: .fit)
          } placeholder: {
              Color.gray
          }
      }
  }
