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
        view.backgroundColor = .white
        return view
    }()
    
    private let cellLabel: UILabel = {
      let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = .black
        label.font = UIFont(name: "bold", size: 24)
        return label
    }()
    
    private let arrowSign: UIImageView = {
       let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "arrow.right")
        return imageView
    }()
    
    private let randomImageViewOne = createUIImageView(name: randomNameOne)
    private let randomImageViewTwo = createUIImageView(name: randomNameTwo)
    private let randomImageViewThree = createUIImageView(name: randomNameThree)
    private let randomImageViewFour = createUIImageView(name: randomNameFour)
    
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
        
        [cellLabel, arrowSign,randomImageViewOne, randomImageViewTwo, randomImageViewThree, randomImageViewFour].forEach { content.addSubview($0) }
        
        let cornerRadius: CGFloat = 6
        
        randomImageViewOne.layer.cornerRadius = cornerRadius
        randomImageViewOne.clipsToBounds = true
        randomImageViewTwo.layer.cornerRadius = cornerRadius
        randomImageViewTwo.clipsToBounds = true
        randomImageViewThree.layer.cornerRadius = cornerRadius
        randomImageViewThree.clipsToBounds = true
        randomImageViewFour.layer.cornerRadius = cornerRadius
        randomImageViewFour.clipsToBounds = true
    }
    private func setupConstraints() {
        let sideSize: CGFloat = (UIScreen.main.bounds.width - 48) / 4
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: contentView.topAnchor),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            cellLabel.topAnchor.constraint(equalTo: content.topAnchor, constant: 12),
            cellLabel.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 12),
            
            arrowSign.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -12),
            arrowSign.centerYAnchor.constraint(equalTo: cellLabel.centerYAnchor),
            arrowSign.heightAnchor.constraint(equalToConstant: 20),
            arrowSign.widthAnchor.constraint(equalToConstant: 20),
            
            randomImageViewOne.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewOne.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewOne.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 12),
            randomImageViewOne.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: 12),
            randomImageViewOne.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -12),
            
            randomImageViewTwo.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewTwo.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewTwo.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 12),
            randomImageViewTwo.leadingAnchor.constraint(equalTo: randomImageViewOne.trailingAnchor, constant: 8),
            randomImageViewTwo.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -12),
            
            randomImageViewThree.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewThree.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewThree.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 12),
            randomImageViewThree.leadingAnchor.constraint(equalTo: randomImageViewTwo.trailingAnchor, constant: 8),
            randomImageViewThree.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -12),
            
            randomImageViewFour.heightAnchor.constraint(equalToConstant: sideSize),
            randomImageViewFour.widthAnchor.constraint(equalToConstant: sideSize),
            randomImageViewFour.topAnchor.constraint(equalTo: cellLabel.bottomAnchor, constant: 12),
            randomImageViewFour.leadingAnchor.constraint(equalTo: randomImageViewThree.trailingAnchor, constant: 8),
            randomImageViewFour.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -12)
            
        ])
    }
}

