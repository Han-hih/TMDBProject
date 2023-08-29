//
//  CustomTextField.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setButton()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setButton() {
        setTitleColor(.green, for: .normal)
        backgroundColor = .clear
        contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.left
        
    }
    
}
