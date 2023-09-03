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
}


class MultipleViewController: BaseViewController {

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
        
        
        
        
        cell.backgroundColor = .red
        
        return cell
        }
    }
    
    
    
    
    

