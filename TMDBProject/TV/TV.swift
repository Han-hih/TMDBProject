//
//  TV.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/20.
//


// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tv = try? JSONDecoder().decode(Tv.self, from: jsonData)

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tv = try? JSONDecoder().decode(Tv.self, from: jsonData)

import Foundation

// MARK: - TvSearch
struct TvSearch: Codable {
 
    let results: [TVSearchResult]
    
    enum CodingKeys: CodingKey {
        case results
        
    }
}
// MARK: - TVSearchResult
struct TVSearchResult: Codable {
    let id: Int

    enum CodingKeys: CodingKey {
        case id
    }
}

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let tVSeason = try? JSONDecoder().decode(TVSeason.self, from: jsonData)

import Foundation

// MARK: - TVSeason
struct TVSeason: Codable {
    let seasons: [Season]
}

// MARK: - Season
struct Season: Codable {
    let episodeCount, id: Int
    let name: String
    let seasonNumber: Int

    enum CodingKeys: String, CodingKey {
        case episodeCount = "episode_count"
        case id, name
        case seasonNumber = "season_number"
    }
}


   

