//
//  FeedViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import UIKit

class FeedViewController: UIViewController {

    private let post = Post(title: "My post")
    private let buttonOne: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show post", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(FeedViewController.self, action: #selector(openPostViewController), for: .touchUpInside)
        return button
    }()
    private let buttonTwo: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Show post one more time", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(FeedViewController.self, action: #selector(openPostViewController), for: .touchUpInside)
        return button
    }()
    private let stackView: UIStackView = {
       let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.backgroundColor = .red
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 10
        return stack
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Feed"
        view.backgroundColor = .systemGray3
        view.addSubview(buttonOne)
        layout()
        setupConstraints()
    }
    private func layout() {
        [buttonOne, buttonTwo].forEach{ stackView.addArrangedSubview($0) }
        [stackView].forEach{ view.addSubview($0) }
    }
    //MARK: set up constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.heightAnchor.constraint(equalToConstant: 150),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    @objc private func openPostViewController() {
        let postController = PostViewController(titlePostViewController: post.title)
        navigationController?.pushViewController(postController, animated: true)
    }
}
