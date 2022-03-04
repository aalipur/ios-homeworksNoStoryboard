//
//  FeedViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    let post = Post(title: "My post")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemGray3
        button()
    }

    func button() {
        let button = UIButton(frame: CGRect(x: 100, y: 50, width: 160, height: 50))
        view.addSubview(button)
        button.setTitle("Show post", for: .normal)
        button.backgroundColor = .red
        button.center = view.center
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(openNextView), for: .touchUpInside)
    }
    @objc func openNextView() {
        let nextVc = PostViewController(titlePostViewController: post.title)
        present(UINavigationController(rootViewController: nextVc), animated: true, completion: nil)
    }
    
}
