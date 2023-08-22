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
    var seasonCount = 0
    var episodeCount: [Int] = []
    var episodeList: [Episode] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
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
        let height = UIScreen.main.bounds.height
        layout.itemSize = CGSize(width: width, height: height / 6)
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 1
        layout.headerReferenceSize = CGSize(width: 100, height: 40)
        tvCollectionView.collectionViewLayout = layout
    }
    
    func nibSetting() {
        let nib = UINib(nibName: TVCollectionViewCell.identifier, bundle: nil)
        tvCollectionView.register(nib, forCellWithReuseIdentifier: TVCollectionViewCell.identifier)
        tvCollectionView.register(UINib(nibName: "TVCollectionReusableView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TVCollectionReusableView")
    }
    // 서치바에 입력한 값을 tvID로 반환해준다.
//    func callSearchRequest(query: String) {
//
//        MovieAPIManager.shared.tvSearchRequestID(query) { value in
//
//            self.tvID = value.results[0].id
//            print(self.tvID)
//        }
//    }
    func callSearchRequest(_ query: String) -> Int{
        
        MovieAPIManager.shared.tvSearchRequestID(query) { value in
            self.tvID = value.results[0].id
        }
        // 이 값을 시즌정보와 에피소드정보(?) 불러오는 함수에 넣어준다.
        return tvID
        
    }
    
    // 시즌 관련 정보 불러오기
    func callSeasonRequest(_ tvID: Int) -> Int {
        MovieAPIManager.shared.tvSeasonRequest(tvID) { value in
            for item in value.seasons {
                let episodcount = item.episodeCount
                let seasonNumber = item.seasonNumber
                let seasonID = item.id
                let seasonName = item.name
                self.seasonList.append(Season(episodeCount: episodcount, id: seasonID, name: seasonName, seasonNumber: seasonNumber))
                print(seasonID, seasonName, seasonNumber, episodcount)
                self.seasonCount = seasonNumber
            }
            self.tvCollectionView.reloadData()
        }
        // 에피소드 개수를 가져와서 컬렉션뷰(에피소드정보) 셀 개수로 만들어주기?
        return seasonCount
    }
    // 이미지, 제목, 에피소드 넘버, 평점, 방영날짜, 러닝타임, 오버뷰 가져오기
    func callEpisodeRequest(_ tvID: Int, seasonNumber: Int) {
        MovieAPIManager.shared.tvEpisodeRequest(tvID, seasonNumber) { value in
            for item in value.episodes ?? [] {
                let title = item.name
                let image = "https://image.tmdb.org/t/p/w500" + item.stillPath
                let rate = item.voteAverage
                let episodeNumber = item.episodeNumber
                let broadDay = item.airDate ?? ""
                let runningTime = item.runtime
                let overview = item.overview
                self.episodeList.append(Episode(airDate: broadDay, episodeNumber: episodeNumber, name: title, overview: overview, runtime: runningTime, seasonNumber: episodeNumber, stillPath: image, voteAverage: rate))
               
            }
            self.tvCollectionView.reloadData()
        }
    }
    
    
}
extension TVViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return seasonCount
            }
        
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            // 섹션개수만큼 for문 돌려서 설정.?
            //        return episodeCount.count
            return episodeList.count
            //        return 14
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TVCollectionViewCell.identifier, for: indexPath) as? TVCollectionViewCell else { return UICollectionViewCell() }
            let row = episodeList[indexPath.row]
            
            cell.configure(row: row)
            
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
            if kind == UICollectionView.elementKindSectionHeader {
                guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TVCollectionReusableView", for: indexPath) as? TVCollectionReusableView else { return UICollectionViewCell() }
                view.headLabel.text = "\(seasonList[0].seasonNumber) \(seasonList[0].name)"
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
        
       tvID = callSearchRequest(query)
//        callSeasonRequest(tvID: callSearchRequest(query))
        print(tvID)
        callEpisodeRequest(tvID, seasonNumber: callSeasonRequest(tvID))
        print(episodeList)
        tvCollectionView.reloadData()
    }
        
        
    }

