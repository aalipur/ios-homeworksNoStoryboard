//
//  CustomTableViewCell.swift
//  Navigation
//
//  Created by Анатолий Алипур on 31.03.2022.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    private let content: UIView = {
       let view = UIView()
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let author: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.numberOfLines = 2
        return label
    }()
    
    private let descriptionPost: UILabel = {
       let text = UILabel()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.numberOfLines = 0
        return text
    }()
    
    private let image: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
         label.textColor = .black
         return label
    }()
    
    private let viewsLabel: UILabel = {
        let label = UILabel()
         label.translatesAutoresizingMaskIntoConstraints = false
         label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
         label.textColor = .black
         return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCell(model: PostModel) {
        author.text = model.author
        image.image = UIImage(named: model.image)
        descriptionPost.text = model.description
        likesLabel.text = "Likes: \(model.likes)"
        viewsLabel.text = "Views: \(model.views)"
    }
    private func setupView() {
        contentView.addSubview(content)
        [author, image, descriptionPost, likesLabel, viewsLabel].forEach{ content.addSubview($0) }
        let vertInset: CGFloat = 16
        NSLayoutConstraint.activate([
            content.topAnchor.constraint(equalTo: contentView.topAnchor),
            content.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            content.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            content.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            author.topAnchor.constraint(equalTo: content.topAnchor, constant: vertInset),
            author.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: vertInset),
            
            image.topAnchor.constraint(equalTo: author.bottomAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: content.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            
            descriptionPost.topAnchor.constraint(equalTo: image.bottomAnchor, constant: vertInset),
            descriptionPost.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: vertInset),
            descriptionPost.trailingAnchor.constraint(equalTo: content.trailingAnchor),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionPost.bottomAnchor, constant: vertInset),
            likesLabel.leadingAnchor.constraint(equalTo: content.leadingAnchor, constant: vertInset),
            likesLabel.bottomAnchor.constraint(equalTo: content.bottomAnchor, constant: -vertInset),
            
            viewsLabel.trailingAnchor.constraint(equalTo: content.trailingAnchor, constant: -vertInset),
            viewsLabel.centerYAnchor.constraint(equalTo: likesLabel.centerYAnchor)
        ])
    }
}
