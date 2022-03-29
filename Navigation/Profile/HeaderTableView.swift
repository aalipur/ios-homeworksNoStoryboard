//
//  HeaderTableView.swift
//  Navigation
//
//  Created by Анатолий Алипур on 29.03.2022.
//

import UIKit

class HeaderTableView: UIView {
    
    private let headerLabel: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.font = UIFont(name: "bold", size: 18)
        return label
    }()
    private let arrowSign: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "arrow.right")
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        [headerLabel, arrowSign].forEach{ addSubview($0) }
    }
    private func setupConstraints() {
        let inset: CGFloat = 12
        NSLayoutConstraint.activate([
            headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            headerLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: inset),
            headerLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
            
            arrowSign.topAnchor.constraint(equalTo: self.topAnchor, constant: inset),
            arrowSign.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -inset),
            arrowSign.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -inset),
            arrowSign.heightAnchor.constraint(equalToConstant: 20),
            arrowSign.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
}
