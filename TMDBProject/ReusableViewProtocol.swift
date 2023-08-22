//
//  ReusableViewProtocol.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/14.
//


import UIKit

protocol ReusableViewProtocol {
    static var identifier: String { get }
}

extension UIViewController: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}
//
extension UICollectionViewCell: ReusableViewProtocol {
    static var identifier: String {
        return String(describing: self)
    }
}

//extension UICollectionReusableView: ReusableViewProtocol {
//    static var identifier: String {
//        return String(describing: self)
//    }
//}
