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
    private let dependencies: DependencyContainer

    init(initialMovieType: MovieType, dependencies: DependencyContainer) {
        self.initialMovieType = initialMovieType
        self.dependencies = dependencies
    }

    func start() -> some View {
        let homeViewCoordinator = HomeViewCoordinator(dependencies: dependencies)
        return homeViewCoordinator.eraseToAnyView()
    }
}
