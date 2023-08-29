//
//  CustomLabel.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit

class CustomLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUILabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setUILabel() {
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        textColor = UIColor.white
        font = .systemFont(ofSize: 20)
        
    }
    
}
