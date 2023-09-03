//
//  MultipleView.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/09/03.
//

import UIKit

class MultipleView: BaseView {

    lazy var tableview = {
        let view = UITableView(frame: .zero, style: .plain)
        view.register(MultipleTableViewCell.self, forCellReuseIdentifier: "MultipleTableViewCell")
        
        
        
        return view
    }()

    
    override func configureView() {
        super.configureView()
        addSubview(tableview)
        tableview.translatesAutoresizingMaskIntoConstraints = false
    }
    
    override func setConstraints() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            tableview.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
}
