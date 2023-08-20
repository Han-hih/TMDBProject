//
//  Genre.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/20.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let genre = try? JSONDecoder().decode(Genre.self, from: jsonData)

import Foundation

// MARK: - Genre
struct Genre: Codable {
    let genres: [GenreElement]
}

// MARK: - GenreElement
struct GenreElement: Codable {
    let id: Int
    let name: String
}

