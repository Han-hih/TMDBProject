//
//  CustomTextField.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit


class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setTextField()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setTextField() {
        backgroundColor = .gray
        borderStyle = .line
        textColor = .white
    }
    
}
