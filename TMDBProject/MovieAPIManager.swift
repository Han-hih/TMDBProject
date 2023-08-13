//
//  MovieAPIManager.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit
import SwiftyJSON
import Kingfisher
import Alamofire

class MovieAPIManager {
    
    static let shared = MovieAPIManager()
    private init() { }
    
    let header: HTTPHeaders = ["accept": "application/json",
                               "Authorization": APIKey.movieKey]
    
    func callrRequest(type: firstEndpoint, secondtype: secondEndPoint, completionHandler: @escaping (JSON) -> ()) {
        let url = type.requestURL + secondtype.secondRequestURL + "api_key=\(APIKey.movieKey)"
        AF
            .request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    print("JSON: \(json)")
                    completionHandler(json)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    func genreRequest(id: Int) -> String {
        
        let url = "https://api.themoviedb.org/3/genre/movie/list"
        var genreName = "#######"
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                print("JSON: \(json)")
                
                for item in json["genres"].arrayValue {
                    if item["id"].intValue == id {
                        genreName = "#" + item["name"].stringValue
                    }
                }
                    
                
                
            case .failure(let error):
                print(error)
            }
            
        }
        
        return genreName
        
        
        
    }
    
    
    
    
    
    
    
    
    
}
    
    
    
    

