//
//  Genre.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/16.
//

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
