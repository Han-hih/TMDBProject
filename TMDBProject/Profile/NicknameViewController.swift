//
//  NicknameViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit

class NicknameViewController: BaseViewController {
    
    let textfield = {
        let view = CustomTextField()
        view.placeholder = "닉네임을 입력해주세요"
        
        return view
    }()
    
    override func configure() {
        super.configure()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonTapped))
        
        view.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
       
    }
  
    

    @objc func doneButtonTapped() {
        // notification 1.
        NotificationCenter.default.post(name: NSNotification.Name("nicknameText"), object: nil, userInfo: ["nickname": textfield.text ?? ""])
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
