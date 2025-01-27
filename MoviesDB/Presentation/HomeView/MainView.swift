//
//  HomeView.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            ForEach(MovieType.allCases, id: \.self) { type in
                MovieListViewFactory.create(movieType: type)
                    .tabItem {
                        Label(type.label, systemImage: type.systemImage)
                    }
            }
        }
    }
}
