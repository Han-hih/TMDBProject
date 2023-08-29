//
//  NameChangeViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit

class NameChangeViewController: BaseViewController {

    
    let textfield = {
        let view = CustomTextField()
        view.placeholder = "이름을 입력해주세요"
       
        return view
    }()
//1.
    var completionHandler: ((String) -> Void)?
    
    override func configure() {
        super.configure()
        view.addSubview(textfield)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonTapped))
    }
    
    @objc func doneButtonTapped() {
        completionHandler?(textfield.text ?? "")
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
   
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //2.
        completionHandler?(textfield.text ?? "")
    }

}
