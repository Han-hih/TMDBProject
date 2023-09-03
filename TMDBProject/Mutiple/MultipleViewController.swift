//
//  MultipleViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/09/03.
//

import UIKit

class MultipleViewController: BaseViewController {

    let mainView = MultipleView()

    
    override func loadView() {
        self.view = mainView
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableview.delegate = self
        mainView.tableview.dataSource = self
        
    }
    


}
extension MultipleViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MultipleTableViewCell", for: indexPath) as? MultipleTableViewCell else { return
            UITableViewCell() }
        cell.backgroundColor = .red
        
        return cell
        }
    }
    
    
    
    
    

