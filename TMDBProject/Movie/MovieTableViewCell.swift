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
        view.layer.cornerRadius = 10
        view.clipsToBounds = true
        view.layer.masksToBounds = false
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.magenta.cgColor
        view.backgroundColor = .magenta
        view.layer.shadowOffset = CGSize(width: 3, height: 3)
        view.layer.shadowRadius = 10
        view.layer.shadowOpacity = 1
        view.layer.shadowColor = UIColor.black.cgColor
        
        return view
    }()
    
    //영화 이미지 뷰
    let movieImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 10
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.masksToBounds = true
        view.clipsToBounds = true
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
        button.setTitleColor(UIColor.white, for: .normal)
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
            //개봉일
            openDateLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            openDateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            //장르
            genreLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            genreLabel.topAnchor.constraint(equalTo: openDateLabel.bottomAnchor, constant: 5),
            //메인뷰
            mainView.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10),
            mainView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.85),
            mainView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.95),
            mainView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),

            //영화이미지
            movieImageView.widthAnchor.constraint(equalTo: mainView.widthAnchor, multiplier: 1),
            movieImageView.heightAnchor.constraint(equalTo: mainView.heightAnchor, multiplier: 0.7),
            movieImageView.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            movieImageView.topAnchor.constraint(equalTo: mainView.topAnchor),
            //평점
            rateLabel.bottomAnchor.constraint(equalTo: movieImageView.bottomAnchor),
            rateLabel.leadingAnchor.constraint(equalTo: movieImageView.leadingAnchor),
            //클립버튼
            clipButton.topAnchor.constraint(equalTo: movieImageView.topAnchor),
            clipButton.trailingAnchor.constraint(equalTo: movieImageView.trailingAnchor),
            clipButton.heightAnchor.constraint(equalTo: movieImageView.heightAnchor, multiplier: 0.2),
            clipButton.widthAnchor.constraint(equalTo: clipButton.heightAnchor, multiplier: 1)
        ])
    }
    
    
    
    func configure(row: Result) {
        openDateLabel.text = row.releaseDate
        
        for key in ViewController.genreList.keys {
            if row.genreIDS[0].codingKey.intValue == key {
                genreName = ViewController.genreList[key] ?? "#####"
            }
        }
        genreLabel.text = "# \(genreName)"
        
        if let url = URL(string: row.backdropPath) {
            movieImageView.kf.setImage(with: url)
        }
        rateLabel.text = "평점: \(String(format: "%2f", row.vote_average))"
        movieNameLabel.text = row.title
        //        charactersLabel.text = row.charactersLabel
        
    }
}

