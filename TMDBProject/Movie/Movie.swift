//
//  Movie.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? JSONDecoder().decode(Movie.self, from: jsonData)


// MARK: - Movie
struct Movie: Codable {
    let totalPages, totalResults: Int
    let results: [Result]
    let page: Int

    enum CodingKeys: String, CodingKey {
        case totalPages = "total_pages"
        case totalResults = "total_results"
        case results, page
    }
}

// MARK: - Result
struct Result: Codable {
    let title: String
    let vote_average: Double
    let backdropPath: String
    let releaseDate, posterPath: String
    let id: Int
    let genreIDS: [Int]
    let overview: String

    enum CodingKeys: String, CodingKey {
        case title, vote_average
//        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case posterPath = "poster_path"
        case id
        case genreIDS = "genre_ids"
        case overview
    }
}

enum MediaType: String, Codable {
    case movie = "movie"
}

enum OriginalLanguage: String, Codable {
    case en = "en"
    case hi = "hi"
}





//struct Movie {
//    var openDateLabel: String
//    var genreLabel: String
//    var movieImageView: String
//    var rateLabel: Double
//    var movieNameLabel: String
//    var charactersLabel: String
//    var id: Int
//    var backImageView: String
//    var overView: String
//}

struct Credits {
    var actorImage: String
    var actorName: String
    var movieActorName: String
}
