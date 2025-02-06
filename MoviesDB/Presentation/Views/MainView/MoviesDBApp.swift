//
//  MoviesDBApp.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//

import SwiftData
import SwiftUI
import CachingModule

@main
struct MoviesDBApp: App {
    private let appCoordinator = AppCoordinator(initialMovieType: .nowPlaying, dependencies: DependencyContainer.shared)
    
    let container: ModelContainer

    init() {
        // SwiftData setup
        container = try! ModelContainer(for: CacheItem.self)
        
        // Cache setup
        let context = ModelContext(container)
        DependencyContainer.shared.setupCacheModule(context: context)
    }

    var body: some Scene {
        WindowGroup {
            appCoordinator.start()
                .environmentObject(DependencyContainer.shared)
        }
    }
}



