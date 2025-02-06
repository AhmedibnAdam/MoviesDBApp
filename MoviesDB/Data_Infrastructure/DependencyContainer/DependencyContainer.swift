//
//  DependencyContainer.swift
//  MoviesDB
//
//  Created by Ahmad on 05/02/2025.
//

import NetworkLayer
import SwiftData
import Foundation
import CachingModule

/// A thread-safe container for managing app-wide dependencies.
@MainActor
final class DependencyContainer: ObservableObject {
    static let shared = DependencyContainer()
    private var dependencies: [String: Any] = [:]
    
    // MARK: - Network
    private(set) var network: NetworkServicing = NetworkService.shared  

    // MARK: - Caching
    private var _cacheModule: CacheModule?

    /// Returns the cache module safely, initializing it if needed.
    var cacheModule: CacheModule {
        guard let cache = _cacheModule else {
            fatalError("CacheModule is not initialized! Call setupCacheModule(context:) first.")
        }
        return cache
    }

    /// Sets up the CacheModule safely.
    func setupCacheModule(context: ModelContext) {
        guard _cacheModule == nil else { return }  // Prevent re-initialization
        do {
            self._cacheModule = try CacheModuleFactory.make(context: context)
        } catch {
            assertionFailure("Failed to initialize CacheModule: \(error)")
        }
    }
    
    // MARK: - Generic Dependency Resolution
    func register<T>(_ dependency: T, for type: T.Type) {
        let key = String(describing: type)
        dependencies[key] = dependency
    }
    
    func resolve<T>(_ type: T.Type) -> T {
        let key = String(describing: type)
        guard let dependency = dependencies[key] as? T else {
            fatalError("Dependency \(key) not registered!")
        }
        return dependency
    }
}
