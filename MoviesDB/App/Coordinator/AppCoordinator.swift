//
//  AppCoordinator.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//

import SwiftUI

@MainActor
final class AppCoordinator: Coordinator {
    private let initialMovieType: MovieType

    init(initialMovieType: MovieType) {
        self.initialMovieType = initialMovieType
    }

    func start() -> some View {
        let homeView = HomeViewCoordinator()
        return homeView.eraseToAnyView()
    }
}
