//
//  TVViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/19.
//

import UIKit

class TVViewController: UIViewController {
    
    @IBOutlet var searchBar: UISearchBar!
    
    @IBOutlet var tvCollectionView: UICollectionView!
    
    
    var tvID = 0
    var seasonList: [Season] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tvCollectionView.delegate = self
        tvCollectionView.dataSource = self
        searchBar.delegate = self
        nibSetting()
        
        setCollectionViewLayOut()
    }
    
    func setCollectionViewLayOut() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let width = UIScreen.main.bounds.width - spacing
        layout.itemSize = CGSize(width: width, height: width / 2)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        tvCollectionView.collectionViewLayout = layout
    }
    
    func nibSetting() {
        let nib = UINib(nibName: TVCollectionViewCell.identifier, bundle: nil)
        tvCollectionView.register(nib, forCellWithReuseIdentifier: TVCollectionViewCell.identifier)
        
    }
    // 서치바에 입력한 값을 tvID로 반환해준다.
    func callSearchRequest(query: String) {
        
        MovieAPIManager.shared.tvSearchRequestID(query) { value in
            
            self.tvID = value.results[0].id
            print(self.tvID)
        }
    }
    
    // 시즌 관련 정보 불러오기
    func callSeasonRequest(tvID: Int) {
        MovieAPIManager.shared.tvSeasonRequest(tvID) { value in
            for item in value.seasons {
                let episodcount = item.episodeCount
                let seasonNumber = item.seasonNumber
                let seasonID = item.id
                let seasonName = item.name
                self.seasonList.append(Season(episodeCount: episodcount, id: seasonID, name: seasonName, seasonNumber: seasonNumber))
                print(seasonID, seasonName, seasonNumber, episodcount)
            }
        }
        
    }
    
    
}
extension TVViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVCollectionViewCell.identifier, for: indexPath) as? TVCollectionViewCell else { return UICollectionViewCell() }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TVCollectionReusableView.identifier, for: indexPath) as? TVCollectionReusableView else { return UICollectionViewCell() }
            
            return view
        }
        else {
            return UICollectionReusableView()
        }
    }
}

extension TVViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let query = searchBar.text else { return }
        
        callSearchRequest(query: query)
        callSeasonRequest(tvID: tvID)
    }
        
        
    }

