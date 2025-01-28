//
//  HomeView.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import SwiftUI

struct HomeView: View {
    @ObservedObject private var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        TabView(selection: $viewModel.selectedMovieType) {
            ForEach(MovieType.allCases, id: \.self) { type in
                MovieListCoordinator(movieType: type).start()
                    .tabItem {
                        Label(type.label, systemImage: type.systemImage)
                    }
                    .tag(type) // This ensures the selection changes when the tab is switched
            }
        }
    }
}
