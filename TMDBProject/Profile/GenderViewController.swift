//
//  GenderViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit

class GenderViewController: BaseViewController {

    let textfield = {
        let view = CustomTextField()
        view.placeholder = "성별을 입력해주세요"
        
        return view
    }()
    
    
    var delegate: PassBoolDelegate?
    
    override func configure() {
        super.configure()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonTapped))
        view.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        setconstraints()
    }
    @objc func doneButtonTapped() {
        delegate?.recieveGender(text: textfield.text ?? "")
        navigationController?.popViewController(animated: true)
    }
    override func setconstraints() {
        NSLayoutConstraint.activate([
            textfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            textfield.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            textfield.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            textfield.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
        
    
    

 

}
