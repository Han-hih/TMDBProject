//
//  MultipleCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/09/03.
//

import UIKit

class MultipleTableViewCell: BaseTableViewCell {
    
    let contentImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let contentTiltleLabel = {
        let label = UILabel()
        
        return label
    }()
    
    let contentOverViewLabel = {
        let label = UILabel()
        
        return label
    }()
    
    let contentGenreLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        
        return label
    }()
    
    let contentTypeLabel = {
        let label = UILabel()
        
        return label
    }()
    
    let rateLabel = {
        let label = UILabel()
        
        return label
    }()
    
    
    override func configure() {
        
        [contentImageView, contentTiltleLabel, contentOverViewLabel, contentGenreLabel, contentTypeLabel, rateLabel].forEach { contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
        
    }
    override func setConstraints() {
        NSLayoutConstraint.activate([
            contentImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            contentImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            contentImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            contentImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.2)
        ])
    }
    
}
