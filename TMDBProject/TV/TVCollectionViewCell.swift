//
//  TVCollectionViewCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/19.
//

import UIKit
import Kingfisher

class TVCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var tvImageView: UIImageView!
    @IBOutlet var tvTitleLabel: UILabel!
    
    @IBOutlet var tvRateLabel: UILabel!
    @IBOutlet var tvDateAndRunningTimeLabel: UILabel!
    @IBOutlet var tvOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    func configure(row: Episode) {
        tvTitleLabel.text = "# \(row.episodeNumber) \(row.name)"
        tvRateLabel.text = "\(row.voteAverage)"
        tvDateAndRunningTimeLabel.text = "\(row.airDate ?? "") | \(row.runtime)분"
        tvOverviewLabel.text = row.overview
        tvOverviewLabel.numberOfLines = 0
        if let url = URL(string: row.stillPath) {
            tvImageView.kf.setImage(with: url)
        }
    }
}
