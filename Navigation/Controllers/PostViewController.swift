//
//  PostViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import UIKit

class PostViewController: UIViewController {

    private let titlePostViewController: String
    
    init(titlePostViewController: String) {
        self.titlePostViewController = titlePostViewController
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray4
        title = titlePostViewController
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(addTapped))
    }
    @objc func addTapped() {
        let infoVc = InfoViewController()
        present(UINavigationController(rootViewController: infoVc), animated: true, completion: nil)
    }
}
