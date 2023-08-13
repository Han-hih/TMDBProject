//
//  URL+Extension.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/13.
//

import Foundation

extension URL {
    static let baseURL = "https://api.themoviedb.org/3/trending/"
    
    static func makeEndPointString(_ endPoint: String, _ secondEndPoint: String) -> String {
        return baseURL + endPoint + secondEndPoint
    }
    
    
    static func makeCreditURL(_ movieID: Int) -> String {
         let creditURL = "https://api.themoviedb.org/3/movie/\(movieID)/credits"
        return creditURL
    }
    
    
}


