//
//  MovieTableViewCell.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/12.
//

import UIKit
import Kingfisher


class MovieTableViewCell: BaseTableViewCell {
    
    
    //개봉날짜
    let openDateLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13)
        return label
    }()
    //장르 레이블
    let genreLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 15)
        
        return label
    }()
    
    // 장르 밑에 뷰(이미지뷰, 평점, 클립버튼, 제목, 등장인물, lineView, 자세히보기 레이블, >버튼)
    let mainView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOffset = CGSize(width: 4, height: 4)
        
        return view
    }()
    
    //영화 이미지 뷰
    let movieImageView = {
        let view = UIImageView()
        return view
    }()
    
    //영화 평점
    let rateLabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.textColor = .purple
        return label
    }()
    //클립버튼
    let clipButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "paperclip.circle.fill"), for: .normal)
        return button
    }()
    //제목레이블
    let movieNameLabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        
        return label
    }()
    // 등장인물
    let creditLabel = {
        let label = UILabel()
        
        return label
    }()
    //라인뷰
    let lineView = {
        let view = UIView()
        view.backgroundColor = .black
        
        return view
    }()
    //자세히보기
    let moreLabel = {
        let label = UILabel()
        label.text = "자세히 보기"
        return label
    }()
    
    //>버튼
    let nextButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "play"), for: .normal)
        
        return button
    }()
    
    
    var genreName = ""
    
    override func configure() {
        [openDateLabel, genreLabel, mainView, movieImageView, rateLabel, clipButton, movieNameLabel, creditLabel, lineView, moreLabel, nextButton ].forEach {
            contentView.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
        
    }
    
    
    override func setConstraints() {
        NSLayoutConstraint.activate([
            openDateLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            openDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            openDateLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    
    
    func configure(row: Result) {
        openDateLabel.text = row.releaseDate
        
        for key in ViewController.genreList.keys {
            if row.genreIDS[0].codingKey.intValue == key {
                genreName = ViewController.genreList[key] ?? "#####"
            }
        }
        genreLabel.text = "#\(row.genreIDS[0])"
        
        if let url = URL(string: row.backdropPath) {
            movieImageView.kf.setImage(with: url)
        }
        rateLabel.text = "\(row.popularity)"
        movieNameLabel.text = row.title
        //        charactersLabel.text = row.charactersLabel
        
    }
}

