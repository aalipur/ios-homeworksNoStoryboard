//
//  PhotoCollectionViewCell.swift
//  Navigation
//
//  Created by Анатолий Алипур on 25.03.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    private let image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleToFill
        return image
    }()
    var data: CustomData?{
        didSet {
            guard let data = data else { return }
            image.image = data.image
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //MARK: functions
    private func setupCell() {
        contentView.addSubview(image)
        contentView.layer.cornerRadius = 12
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.black.cgColor
        contentView.clipsToBounds = true
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}
