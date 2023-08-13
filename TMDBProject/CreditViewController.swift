//
//  CreditViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/13.
//

import UIKit

class CreditViewController: UIViewController {
    @IBOutlet var movieBackgroundImageView: UIImageView!
    @IBOutlet var moviePosterImageView: UIImageView!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var overViewTabelCell: UITableViewCell!
    @IBOutlet var castActorTableView: UITableView!
    @IBOutlet var overViewLabel: UILabel!
    
    let creditList: [Credits] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        castActorTableView.delegate = self
        castActorTableView.dataSource = self
        
    }
    
    func nibSetting() {
        let nib = UINib(nibName: CreditTableViewCell.identifier, bundle: nil)
        castActorTableView.register(nib, forCellReuseIdentifier: CreditTableViewCell.identifier)
    }
 
    func callRequest() {
        m
    }
    
    
}


extension CreditViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CreditTableViewCell.identifier) as? CreditTableViewCell else { return UITableViewCell() }
        let row = creditList[indexPath.row]
        
        cell.configure(row: row)
        return cell
    }
    
    
}
