//
//  TMDBMovieServiceRepository.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation
import NetworkLayer
import CachingModule


final class TMDBMovieServiceRepository: MovieServiceRepositoryProtocol {
   
    private let network: NetworkServicing
    private let cache: CacheModule
    private let jsonDecoder: JSONDecoder
    
    init(network: NetworkServicing,
         cache: CacheModule,
         decoder: JSONDecoder = .init()) {
        self.network = network
        self.cache = cache
        self.jsonDecoder = decoder
    }
    
    func fetchMovies(type: String) async throws -> [MoviesEntity.Movie] {
        let cacheKey = "Movies_\(type)"
        var movies: [MoviesEntity.Movie] = []
        
        if let cachedData: Data = try await cache.dataCache.get(forKey: cacheKey) {
            movies = try jsonDecoder.decode([MoviesEntity.Movie].self, from: cachedData)
        }
        
        // Network fallback
        let request = MoviesEndpoint.getMoviesList(type: type)
        let data: MoviesEntity.MovieResponse = try await NetworkService.shared.request(request)
        
        // Update cache
        let encodedData = try JSONEncoder().encode(data.results)
        try await cache.dataCache.set(encodedData, forKey: cacheKey)
        movies = data.results
        return movies
        
    }
    
    func fetchMovieDetails(id: Int) async throws -> MoviesEntity.Movie {
        let request = MoviesEndpoint.getMovie(id: id)
        let data: MoviesEntity.Movie = try await NetworkService.shared.request(request)
        return data
    }
    
    func clearUserData(id: String) async throws {
        
    }
    
}

