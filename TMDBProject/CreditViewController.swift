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
    
    var creditList: [Credits] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        castActorTableView.delegate = self
        castActorTableView.dataSource = self
        castActorTableView.rowHeight = 80
        nibSetting()
        callRequest(id: 346698)
    }
    
    func nibSetting() {
        let nib = UINib(nibName: CreditTableViewCell.identifier, bundle: nil)
        castActorTableView.register(nib, forCellReuseIdentifier: CreditTableViewCell.identifier)
    }
    
    func callRequest(id: Int) {
        MovieAPIManager.shared.creditsRequest(id: id) { json in
            for item in json["cast"].arrayValue {
                
                    let actorImage = "https://image.tmdb.org/t/p/w200" + item["profile_path"].stringValue
                    let actorName = item["original_name"].stringValue
                    let actorMovieName = item["character"].stringValue
                if item["known_for_department"].stringValue == "Acting" {
                    self.creditList.append(Credits(actorImage: actorImage, actorName: actorName, movieActorName: actorMovieName))
                    print(self.creditList)
                }
            }
            self.castActorTableView.reloadData()
        }
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
