//
//  URL+Extension.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/13.
//

import Foundation

extension URL {
    static let baseURL = "https://api.themoviedb.org/3/"
    static let tvBaseURL = "https://api.themoviedb.org/3/tv/"
    static func makeEndPointString(_ endPoint: String, _ secondEndPoint: String) -> String {
        return baseURL + "trending/" + endPoint + secondEndPoint
    }
    
    
    static func makeCreditURL(_ movieID: Int) -> String {
        let creditURL = "https://api.themoviedb.org/3/movie/\(movieID)/credits"
        print(creditURL)
        return creditURL
    }
    
    static func makeTvURL(_ query: String) -> String {
        let tvURL = baseURL + "search/tv?query=" + query
        return tvURL
    }
    
    static func makeTVSeasonURL(_ tvID: Int) -> String {
        let seasonURL = tvBaseURL + "\(tvID)"
        return seasonURL
    }
    
    static func makeTVEpisode(_ tvID: Int, _ seasonNum: Int) -> String {
        let episodeURL = tvBaseURL + "\(tvID)/season/\(seasonNum)"
        return episodeURL
    }
    
}


