//
//  TVCollectionViewCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/19.
//

import UIKit

class TVCollectionViewCell: UICollectionViewCell {

    @IBOutlet var tvImageView: UIImageView!
    @IBOutlet var tvTitleLabel: UILabel!
    
    @IBOutlet var tvRateLabel: UILabel!
    @IBOutlet var tvDateAndRunningTimeLabel: UILabel!
    @IBOutlet var tvOverviewLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
