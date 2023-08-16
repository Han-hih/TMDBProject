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
                               "Authorization": APIKey.movieAcces]
    
    func callrRequest(type: firstEndpoint, secondtype: secondEndPoint, completionHandler: @escaping (JSON) -> ()) {
        let url = type.requestURL + secondtype.secondRequestURL + "api_key=\(APIKey.movieKey)"
        AF
            .request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseJSON { response in
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
//                    print("JSON: \(json)")
                    completionHandler(json)
                    
                case .failure(let error):
                    print(error)
                }
            }
    }

    func genreRequest(completionHandler: @escaping(JSON) -> ())  {
//
        let url = "https://api.themoviedb.org/3/genre/movie/list"
//        AF.request(url, method: .get).validate().responseDecodable(completionHandler: <#T##(DataResponse<Decodable, AFError>) -> Void#>)
//        }
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
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

    func creditsRequest(id: Int, completionHandler: @escaping(JSON) -> ()) {
        let url = URL.makeCreditURL(id)
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
//                print("JSON: \(json)")
                completionHandler(json)
                
            case .failure(let error):
                print(error)
            }
            
        }
        
    }
    
}

