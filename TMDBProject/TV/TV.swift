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

