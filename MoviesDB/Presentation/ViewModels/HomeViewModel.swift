//
//  HomeViewModel.swift
//  MoviesDB
//
//  Created by Ahmad on 28/01/2025.
//


import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var selectedMovieType: MovieType
    private let coordinator: any Coordinator
    let dependencies: DependencyContainer

    init(selectedMovieType: MovieType, coordinator: any Coordinator, dependencies: DependencyContainer) {
        self.dependencies = dependencies
        self.selectedMovieType = selectedMovieType
        self.coordinator = coordinator
    }
    
    func updateSelectedMovieType(to newType: MovieType) {
        selectedMovieType = newType
    }
}
