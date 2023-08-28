//
//  PageViewController.swift
//  TMDBProject
//
//  Created by 황인호 on 2023/08/25.
//

import UIKit

class FirstViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
}

class SecondViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
    }
}

class ThirdViewController: UIViewController {
    
    let nextButton = {
        let button = UIButton()
        button.setTitle("메인화면으로", for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(nextVC), for: .touchUpInside)
        
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        view.addSubview(nextButton)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        setAutoLayout()
    }
    
    @objc func nextVC() {
         let vc = ViewController()
//        let nav = UINavigationController(rootViewController: vc)
//        nav.modalPresentationStyle = .fullScreen
        
        present(vc, animated: true)
    }
    
    func setAutoLayout() {
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalTo: nextButton.widthAnchor)
            ])
        
        
    }
    
}







class PageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    //1.
        var list: [UIViewController] = []
    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        list = [FirstViewController(), SecondViewController(), ThirdViewController()]
        view.backgroundColor = .cyan
        delegate = self
        dataSource = self
        
        guard let first = list.first else { return }
        setViewControllers([first], direction: .reverse, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        let previousIndex = currentIndex - 1
        return previousIndex < 0 ? nil : list[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let currentIndex = list.firstIndex(of: viewController) else { return nil }
        let nextIndex = currentIndex + 1
        return nextIndex >= list.count ? nil : list[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return list.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let first = viewControllers?.first, let index = list.firstIndex(of: first) else { return 0 }
        return index
    }

}
