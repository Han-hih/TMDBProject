//
//  EndPoint.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/13.
//

import Foundation


enum firstEndpoint {
    case all
    case movie
    case tv
    case person
    
    var requestURL: String {
        switch self {
        case.all: return URL.baseURL + "all/"
        case.movie: return URL.baseURL + "movie/"
        case.tv: return URL.baseURL + "tv/"
        case.person: return URL.baseURL + "person/"
        }
    }
    
}

enum secondEndPoint {
    case week
    case day
    
    var secondRequestURL: String {
        switch self {
        case.week: return "week?"
        case.day: return "day?"
        }
    }
    
}
