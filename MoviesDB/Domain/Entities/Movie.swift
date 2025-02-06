//
//  Movie.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

// MARK: - Models

struct MoviesEntity {
    
    struct MoviesListRequestModel: BaseModel, Sendable {
        let movieType: MovieType
    }
    
    struct MoviesDetailsRequestModel: BaseModel {
        let id: Int
    }

    struct MovieResponse: Codable, Sendable {
        let results: [Movie]
    }
    
    struct Movie: Codable, Identifiable, Sendable {
        let id: Int
        let title: String
        let release_date: String
        let poster_path: String?
        let overview: String?
        let genres: [Genre]?
        let runtime: Int?
        
        var posterURL: URL? {
            guard let path = poster_path else { return nil }
            return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
        }
    }

    struct Genre: Codable, Sendable {
        let id: Int
        let name: String
    }

    
    
}


