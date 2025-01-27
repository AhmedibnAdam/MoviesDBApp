//
//  MovieTab.swift
//  MoviesDB
//
//  Created by Ahmad on 27/01/2025.
//


enum MovieType: String, CaseIterable {
    case nowPlaying = "now_playing"
    case upcoming = "upcoming"
    case popular = "popular"

    var label: String {
        switch self {
        case .nowPlaying: return "Now Playing"
        case .upcoming: return "Upcoming"
        case .popular: return "Popular"
        }
    }

    var systemImage: String {
        switch self {
        case .nowPlaying: return "play.circle.fill"
        case .upcoming: return "calendar.circle.fill"
        case .popular: return "star.circle.fill"
        }
    }
}
