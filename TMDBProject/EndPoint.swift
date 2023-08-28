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
        case.all: return "all/"
        case.movie: return "movie/"
        case.tv: return "tv/"
        case.person: return "person/"
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

