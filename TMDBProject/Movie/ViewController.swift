//
//  ViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var tableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.rowHeight = UITableView.automaticDimension
        view.delegate = self
        view.dataSource = self
        view.register(MovieTableViewCell.self, forCellReuseIdentifier: MovieTableViewCell.identifier)
        view.rowHeight = 400
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var movieList: [Result] = []
    var page = 1
    var isEnd = false
    
   static var genreList: [Int: String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(tableView)
        autoLayout()
        tableView.prefetchDataSource = self
        genreRequest()
//        nibSetting()
        callRequest(page: page)
    }
    func autoLayout() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    
    func callRequest(page: Int) {
        MovieAPIManager.shared.callrRequest(type: .movie, secondtype: .week) { value in
            print(value)
            for item in value.results {
                let title = item.title
                let rate = item.vote_average
                let openDate = item.releaseDate
                let movieImage = "https://image.tmdb.org/t/p/w500" + item.backdropPath
                let genre = item.genreIDS
                let id = item.id
                let background = "https://image.tmdb.org/t/p/w500" + item.posterPath
                let overview = item.overview
                self.movieList.append(Result(title: title, vote_average: rate, backdropPath: movieImage, releaseDate: openDate, posterPath: background, id: id, genreIDS: genre, overview: overview))
            }
            self.tableView.reloadData()
        }
        
    }
    
    func genreRequest() {
        MovieAPIManager.shared.genreRequest { value in
            //            print("__________", value)
            for item in value.genres {
                let name = item.name
                let id = item.id
                ViewController.genreList.updateValue(name, forKey: id)
                
            }
            //            print(self.genreList)
        }
    }
    //
    //        MovieAPIManager.shared.genreRequest() { value in
    //            for item in json["genres"].arrayValue {
    //                let name = item["name"].stringValue
    //                let id = item["id"].intValue
    //                self.genreList.updateValue(name, forKey: id)
    //                }
    //            print(self.genreList)
    //            }
    
    
    
    // 영화 테이블 뷰 닙 설정
    func nibSetting() {
        let nib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier, for: indexPath) as? MovieTableViewCell else { return UITableViewCell() }
        let row = movieList[indexPath.row]
        cell.configure(row: row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        guard let viewcontroller = storyboard.instantiateViewController(withIdentifier: CreditViewController.identifier) as? CreditViewController else { return }
        viewcontroller.test = movieList[indexPath.row]
        
        viewcontroller.movieNameLabel?.text = movieList[indexPath.row].title
        if let url = URL(string: movieList[indexPath.row].posterPath) {
            viewcontroller.moviePosterImageView?.kf.setImage(with: url)
        }
        viewcontroller.idValue = movieList[indexPath.row].id
//        print(#function, movieList[indexPath.row].movieNameLabel, "=================================")
        
        
        //        viewcontroller.modalPresentationStyle = .fullScreen
        self.navigationController?.pushViewController(viewcontroller, animated: true)
        
    }
}
