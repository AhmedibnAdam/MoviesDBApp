//
//  Movie.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


import Foundation

// MARK: - Models

struct MoviesEntity {
    
    struct MoviesListRequestModel: BaseModel {
        let movieType: MovieType
    }
    
    struct MoviesDetailsRequestModel: BaseModel {
        let id: Int
    }

    struct MovieResponse: Decodable {
        let results: [Movie]
    }
    
    
}


struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let release_date: String
    let poster_path: String?
    let overview: String?
    let genres: [Genre]?
    let runtime: Int?
    
    init(id: Int, title: String, release_date: String, poster_path: String?, overview: String?, genres: [Genre]?, runtime: Int?) {
        self.id = id
        self.title = title
        self.release_date = release_date
        self.poster_path = poster_path
        self.overview = overview
        self.genres = genres
        self.runtime = runtime
    }
    
    var posterURL: URL? {
        guard let path = poster_path else { return nil }
        return URL(string: "https://image.tmdb.org/t/p/w500\(path)")
    }
}

struct Genre: Decodable {
    let id: Int
    let name: String
}
