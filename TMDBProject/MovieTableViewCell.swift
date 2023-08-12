//
//  MovieTableViewCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit


class MovieTableViewCell: UITableViewCell {

    static let identifier = "MovieTableViewCell"
    
    @IBOutlet var openDateLabel: UILabel!
    @IBOutlet var genreLabel: UILabel!
    @IBOutlet var movieImageView: UIImageView!
    @IBOutlet var rateLabel: UILabel!
    @IBOutlet var clipButton: UIButton!
    @IBOutlet var movieNameLabel: UILabel!
    @IBOutlet var charactersLabel: UILabel!
    
    @IBOutlet var detailLabel: UILabel!
    @IBOutlet var detailButton: UIButton!
    
    
    func configure(row: Movie) {
        openDateLabel.text = row.openDateLabel
        genreLabel.text = row.genreLabel
        movieImageView.image = row.movieImageView
        rateLabel.text = row.rateLabel
        movieNameLabel.text = row.movieNameLabel
        charactersLabel.text = row.charactersLabel
        detailLabel.text = row.detailLabel
        
    }
    
   
    
    
    
    
}
