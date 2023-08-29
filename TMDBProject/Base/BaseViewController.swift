//
//  BaseViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/28.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        configure()
        setconstraints()
        
        
    }
    
    func configure() {
        
    }
    
    func setconstraints() {
        
    }
    
    
    
}
