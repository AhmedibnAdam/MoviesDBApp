//
//  MovieOverviewView.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

  struct MovieOverviewView: View {
      let overview: String?

      var body: some View {
          Text(overview ?? "No overview available")
              .padding()
      }
  }

