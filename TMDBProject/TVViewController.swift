//
//  TVViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/19.
//

import UIKit

class TVViewController: UIViewController {

    @IBOutlet var tvReuseCollectionView: UICollectionReusableView!
    
    @IBOutlet var tvCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()

        tvCollectionView.delegate = self
        tvCollectionView.dataSource = self
        
        
        
    }
    


}

extension TVViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
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

