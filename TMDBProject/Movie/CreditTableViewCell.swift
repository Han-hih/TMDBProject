//
//  CreditTableViewCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/13.
//

import UIKit
import Kingfisher

class CreditTableViewCell: BaseTableViewCell {

    @IBOutlet var actorImage: UIImageView!
    @IBOutlet var actorNameLabel: UILabel!
    @IBOutlet var actorMovieName: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func configure() { }
    
    
    override func setConstraints() {  }
    
    func configure(row: Credits) {
        if let url = URL(string: row.actorImage) {
            actorImage.kf.setImage(with: url)
        }
        actorMovieName.text = row.movieActorName
        actorNameLabel.text = row.actorName
    }
    

    }
    

