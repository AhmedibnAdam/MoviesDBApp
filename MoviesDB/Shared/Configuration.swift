//
//  Configuration.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

public final class Configuration {
    // MARK: - Singleton Instance
    public static let shared = Configuration()
    
    // MARK: - Private Initializer
    private init() {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        infoDictionary = dict
    }
    
    // MARK: - Private Properties
    private let infoDictionary: [String: Any]
    
    // MARK: - Computed Properties
    var serverURL: URL {
        guard let serverURLstring = infoDictionary["SERVER_URL"] as? String else {
            fatalError("Server URL not set in plist for this environment")
        }
        guard let url = URL(string: serverURLstring) else {
            fatalError("Server URL is invalid")
        }
        return url
    }
    
    var rootURL: URL {
        guard let rootURLstring = infoDictionary["ROOT_URL"] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: rootURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }
    
    var socketURL: URL {
        guard let serverURLstring = infoDictionary["SOCKET_URL"] as? String else {
            fatalError("Socket URL not set in plist for this environment")
        }
        guard let url = URL(string: serverURLstring) else {
            fatalError("Socket URL is invalid")
        }
        return url
    }
    
    var apiKey: String {
        guard let apiKey = infoDictionary["API_KEY"] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return apiKey
    }
    
    var environment: String {
        guard let environment = infoDictionary["ENVIRONMENT"] as? String else {
            fatalError("Environment not set in plist for this environment")
        }
        return environment
    }
    
    var bundleIdentifier: String {
        guard let bundleIdentifier = infoDictionary["APP_BUNDLE_ID"] as? String else {
            fatalError("Bundle Identifier not set in plist for this environment")
        }
        return bundleIdentifier
    }
    
    var loaderAnimationName: String {
        guard let loaderAnimationName = infoDictionary["LOADER_ANIMATION_NAME"] as? String else {
            fatalError("Loader Animation Name not set in plist for this environment")
        }
        return loaderAnimationName
    }
}
