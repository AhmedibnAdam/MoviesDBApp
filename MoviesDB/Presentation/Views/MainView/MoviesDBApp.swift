//
//  MoviesDBApp.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftUI

@main
struct MoviesDBApp: App {
    private let appCoordinator = AppCoordinator(initialMovieType: .nowPlaying)
    
    var body: some Scene {
        WindowGroup {
             appCoordinator.start()
            
        }
    }
}
