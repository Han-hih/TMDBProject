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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        movieTableView.delegate = self
        movieTableView.dataSource = self
        nibSetting()
    }
    
    
    // 영화 테이블 뷰 닙 설정
    func nibSetting() {
        let nib = UINib(nibName: MovieTableViewCell.identifier, bundle: nil)
        movieTableView.register(nib, forCellReuseIdentifier: MovieTableViewCell.identifier)
        
    }
    
}
//영화 테이블 뷰 설정
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.identifier) as? MovieTableViewCell else { return UITableViewCell() }
        let row = movieList[indexPath.row]
        
        cell.configure(row: row)
        
        return cell
    }
    
    
}
