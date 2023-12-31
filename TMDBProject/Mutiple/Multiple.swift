//
//  Multiple.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/09/03.
//

import Foundation


struct Multiple: Codable {
    let totalPages: Int?
    let page: Int
    let results: [Results]

}

enum CodingKeys: String, CodingKey {
    case totalPages = "total_pages"
    case results, page
}

//tv면 name movie면 title
struct Results: Codable {
    let backdrop_path, overview, media_type: String
    let title, name: String?
    let vote_average: Double
    let genreIDS: [Int]?
}
