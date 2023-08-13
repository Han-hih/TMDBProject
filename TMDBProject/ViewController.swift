//
//  ViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var movieTableView: UITableView!
    var movieList: [Movie] = []
    var page = 1
    var isEnd = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        movieTableView.prefetchDataSource = self
        tableviewSetting()
        movieTableView.rowHeight = 400
        nibSetting()
        callRequest(page: page)
    }
    
    func tableviewSetting() {
        

    }
    
    
    func callRequest(page: Int) {
        MovieAPIManager.shared.callrRequest(type: .movie, secondtype: .week) { json in
            for item in json["results"].arrayValue {
                let title = item["title"].stringValue
                let rate = item["vote_average"].doubleValue
                let openDate = item["release_date"].stringValue
                let movieImage = "https://image.tmdb.org/t/p/w500" + item["backdrop_path"].stringValue
                let genre = item["genre_ids"][0].intValue
                let id = item["id"].intValue
                let background = item["poster_path"].stringValue
                let overview = item["overview"].stringValue
                self.movieList.append(Movie(openDateLabel: openDate, genreLabel: "\(genre)", movieImageView: movieImage, rateLabel: rate, movieNameLabel: title, charactersLabel: "ㄴㄴㄴㄴ", id: id, backImageView: background, overView: overview))
                print(self.movieList)
            }
            self.movieTableView.reloadData()
        }
    }
    
    
    // 영화 테이블 뷰 닙 설정
    func nibSetting() {
        let nib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
    }
    
}
//영화 테이블 뷰 설정
extension ViewController: UITableViewDelegate, UITableViewDataSource, UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for indexPath in indexPaths {
            if movieList.count - 1 == indexPath.row && page < 15 && isEnd == false {
                page += 1
                callRequest(page: page)
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else { return UITableViewCell() }
        let row = movieList[indexPath.row]
        cell.layer.cornerRadius = 8
        cell.clipsToBounds = true
        cell.layer.borderWidth = 1
        cell.layer.borderColor = UIColor.black.cgColor
        cell.configure(row: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        <#code#>
    }
    
}
