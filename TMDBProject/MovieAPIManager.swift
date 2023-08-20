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
    
    
    var genreList: GenreElement = GenreElement(id: 0, name: "")
    //    var list: Movie = Movie(openDateLabel: "", genreLabel: "", movieImageView: "", rateLabel: 0.0, movieNameLabel: "", charactersLabel: "", id: 0, backImageView: "", overView: "")
    static let shared = MovieAPIManager()
    private init() { }
    
    let header: HTTPHeaders = ["accept": "application/json",
                               "Authorization": APIKey.movieAcces]
    
    func callrRequest(type: firstEndpoint, secondtype: secondEndPoint, completionHandler: @escaping (Movie) -> ()) {
        let url = type.requestURL + secondtype.secondRequestURL + "api_key=\(APIKey.movieKey)"
        AF
        //            .request(url, headers: header)
        //            .validate(statusCode: 200...500)
        //            .responseDecodable(of: Movie.self) { movi in
        //                <#code#>
        //            }
            .request(url, method: .get, headers: header)
            .validate(statusCode: 200...500)
            .responseDecodable(of: Movie.self) { data in
                switch data.result {
                case .success(let value):
                    completionHandler(value)
                case .failure(let error):
                    print(error)
                }
            }
    }
    func tvSearchRequestID(_ query: String, completionHandler: @escaping(TvSearch) -> ()) {
        guard let text = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) else { return }
        let url = URL.makeTvURL(text)
        
        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseDecodable(of: TvSearch.self) { data in
            switch data.result {
            case.success(let value):
                completionHandler(value)
            case.failure(let error):
                print(error)
            }
        }
    }
    
    //
    func genreRequest(completionHandler: @escaping(Genre) -> Void)  {
        //
        let url = "https://api.themoviedb.org/3/genre/movie/list"
        AF.request(url, headers: header).validate(statusCode: 200...500).responseDecodable(of: Genre.self) { data in
            switch data.result {
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
            
            
        }
    }
    //        AF.request(url, method: .get, headers: header).validate(statusCode: 200...500).responseJSON { response in
    //            switch response.result {
    //            case .success(let value):
    //                let json = JSON(value)
    //                print("JSON: \(json)")
    //                completionHandler(json)
    //
    //
    //            case .failure(let error):
    //                print(error)
    //            }
    //
    //        }
    
    
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

