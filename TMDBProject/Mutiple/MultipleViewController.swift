//
//  MultipleViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/09/03.
//

import UIKit


enum Type {
    case tv
    case movie
    case Person
    
    
}



class MultipleViewController: BaseViewController {

    
    var media = Type.tv
    
    let mainView = MultipleView()
    var list: Multiple = Multiple(totalPages: 0, page: 0, results: [])
    
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableview.delegate = self
        mainView.tableview.dataSource = self
        
        MovieAPIManager.shared.allRequest { data in
            guard let data = data else {
                print("ERROR")
                return
            }
            self.list = data
            self.mainView.tableview.reloadData()
        }
        
    }
    


}
extension MultipleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MultipleTableViewCell", for: indexPath) as? MultipleTableViewCell else { return
            UITableViewCell() }
        
        
        if list.results[indexPath.row].media_type == "tv" {
            cell.backgroundColor = UIColor.red
        } else if list.results[indexPath.row].media_type == "movie" {
            cell.backgroundColor = UIColor.blue
        } else {
            cell.backgroundColor = UIColor.white
        }
        
        

        guard let url = URL(string: "https://image.tmdb.org/t/p/w500" + list.results[indexPath.row].backdrop_path) else { return UITableViewCell() }
        cell.contentImageView.load(url: url)
        
        return cell
        }
    
    func getBackgroundColor() -> UIColor {
        switch media {
        case .tv: return UIColor.systemRed
        case .movie: return UIColor.systemBlue
        case .Person: return UIColor.systemCyan
        }
    }
    
    
    }
    
    
    
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
    

