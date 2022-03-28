//
//  PhotoTableViewCell.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.03.2022.
//

import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    private let content: UIView = {
       let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    weak var delegate: MyViewDelegate?
    private let randomImageViewOne = createUIImageView(name: randomNameOne)
    private let randomImageViewTwo = createUIImageView(name: randomNameTwo)
    private let randomImageViewThree = createUIImageView(name: randomNameThree)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupContent()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: functions
    private func setupContent() {
        contentView.addSubview(content)
        [randomImageViewOne, randomImageViewTwo, randomImageViewThree].forEach { content.addSubview($0) }
        randomImageViewOne.layer.cornerRadius = 12
        randomImageViewOne.layer.borderWidth = 2
        randomImageViewOne.layer.borderColor = UIColor.black.cgColor
        randomImageViewOne.clipsToBounds = true
        
        randomImageViewTwo.layer.cornerRadius = 12
        randomImageViewTwo.layer.borderWidth = 2
        randomImageViewTwo.layer.borderColor = UIColor.black.cgColor
        randomImageViewTwo.clipsToBounds = true
        
        randomImageViewThree.layer.cornerRadius = 12
        randomImageViewThree.layer.borderWidth = 2
        randomImageViewThree.layer.borderColor = UIColor.black.cgColor
        randomImageViewThree.clipsToBounds = true
    }
    private func setupConstraints() {
        let sideSize: CGFloat = 100
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: contentView.topAnchor),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            randomImageViewOne.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewOne.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewOne.topAnchor.constraint(equalTo: content.topAnchor,constant: 8),
            randomImageViewOne.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 16),
            randomImageViewOne.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -8),
            
            randomImageViewTwo.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewTwo.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewTwo.topAnchor.constraint(equalTo: content.topAnchor, constant: 8),
            randomImageViewTwo.leadingAnchor.constraint(equalTo: randomImageViewOne.trailingAnchor, constant: 8),
            randomImageViewTwo.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -8),
            
            randomImageViewThree.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewThree.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewThree.topAnchor.constraint(equalTo: content.topAnchor, constant: 8),
            randomImageViewThree.leadingAnchor.constraint(equalTo: randomImageViewTwo.trailingAnchor, constant: 8),
            randomImageViewThree.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -8)
        ])
    }
}

