//
//  File.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/28.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: MovieTableViewCell.identifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    //addSubView
    func configure() { }
    
    
    
    //오토레이아웃
    func setConstraints() { }
    
    
    
    
}
