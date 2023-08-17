//
//  MovieTableViewCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit
import Kingfisher


class MovieTableViewCell: UITableViewCell {

    
    @IBOutlet var openDateLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var clipButton: UIButton!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var charactersLabel: UILabel!
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var detailButton: UIButton!
    
    
    
    
    
    
    func configure(row: Result) {
        openDateLabel.text = row.releaseDate
        genreLabel.text = "\(row.genreIDS[0])"
        if let url = URL(string: row.backdropPath) {
            movieImageView.kf.setImage(with: url)
        }
        rateLabel.text = "\(row.popularity)"
        movieNameLabel.text = row.title
//        charactersLabel.text = row.charactersLabel
        
    }
    
   
    
    
    
    
}
