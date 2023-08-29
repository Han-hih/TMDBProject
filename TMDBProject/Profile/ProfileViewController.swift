//
//  ProfileViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/29.
//

import UIKit

class ProfileViewController: BaseViewController {

    let myImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.white.cgColor
        view.layer.cornerRadius = view.frame.width / 2
        view.backgroundColor = .white
        return view
    }()
    
    let labelView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        
        return view
    }()
    
    let nameLabelView = {
        let label = CustomLabel()
        label.text = "이름"
        return label
    }()
    
    let nickNameLabelView = {
        let label = CustomLabel()
        label.text = "사용자 이름"
        return label
    }()
    
    let genderLabelView = {
        let label = CustomLabel()
        label.text = "성별"
        return label
    }()
    
    let nameTextButton = {
        let button = CustomButton()
        button.setTitle("이름", for: .normal)
        
        return button
    }()
    
    let nicknameTextButton = {
        let button = CustomButton()
        button.setTitle("사용자 이름", for: .normal)
        
        return button
    }()
    
    let genderTextButton = {
        let button = CustomButton()
        button.setTitle("성별", for: .normal)
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "프로필 편집"
        navigationItem.titleView?.tintColor = .white
        configure()
        setconstraints()
    }
    
    override func configure() {
        super.configure()
        [myImageView, labelView, nameLabelView, nickNameLabelView, genderLabelView, nameTextButton, nicknameTextButton, genderTextButton ].forEach {
            view.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    override func setconstraints() {
        NSLayoutConstraint.activate([
            //프로필이미지
            myImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            myImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3),
            myImageView.heightAnchor.constraint(equalTo: myImageView.widthAnchor),
            // 레이블 뷰
            labelView.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 20),
            labelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            labelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            labelView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4),
            //이름레이블
            nameLabelView.topAnchor.constraint(equalTo: labelView.topAnchor, constant: 10),
            nameLabelView.leadingAnchor.constraint(equalTo: labelView.leadingAnchor),
            nameLabelView.heightAnchor.constraint(equalTo: labelView.heightAnchor, multiplier: 0.2),
            nameLabelView.widthAnchor.constraint(equalToConstant: 100),
            //닉네임 레이블
            nickNameLabelView.topAnchor.constraint(equalTo: nameLabelView.bottomAnchor),
            nickNameLabelView.leadingAnchor.constraint(equalTo: nameLabelView.leadingAnchor),
            nickNameLabelView.heightAnchor.constraint(equalTo: nameLabelView.heightAnchor),
            nickNameLabelView.widthAnchor.constraint(equalTo: nameLabelView.widthAnchor),
            //성별 레이블
            genderLabelView.topAnchor.constraint(equalTo: nickNameLabelView.bottomAnchor),
            genderLabelView.leadingAnchor.constraint(equalTo: nameLabelView.leadingAnchor),
            genderLabelView.heightAnchor.constraint(equalTo: nameLabelView.heightAnchor),
            genderLabelView.widthAnchor.constraint(equalTo: nameLabelView.widthAnchor),
            //이름 텍스트 필드
            nameTextButton.topAnchor.constraint(equalTo: nameLabelView.topAnchor),
            nameTextButton.leadingAnchor.constraint(equalTo: nameLabelView.trailingAnchor),
            nameTextButton.heightAnchor.constraint(equalTo: nameLabelView.heightAnchor),
            nameTextButton.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            //사용자이름 버튼
            nicknameTextButton.topAnchor.constraint(equalTo: nameTextButton.bottomAnchor),
            nicknameTextButton.leadingAnchor.constraint(equalTo: nickNameLabelView.trailingAnchor),
            nicknameTextButton.heightAnchor.constraint(equalTo: nickNameLabelView.heightAnchor),
            nicknameTextButton.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
            //성별 버튼
            genderTextButton.topAnchor.constraint(equalTo: nicknameTextButton.bottomAnchor),
            genderTextButton.leadingAnchor.constraint(equalTo: genderLabelView.trailingAnchor),
            genderTextButton.heightAnchor.constraint(equalTo: genderLabelView.heightAnchor),
            genderTextButton.trailingAnchor.constraint(equalTo: labelView.trailingAnchor),
        ])
    }
    
}
