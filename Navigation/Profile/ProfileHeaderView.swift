//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Анатолий Алипур on 05.03.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private let profileImage: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "vorratokon")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 60
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    private let profileName: UILabel = {
       let profileName = UILabel()
        profileName.text = "Hipster Cat"
        profileName.font = UIFont(name: "bold", size: 18)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.textColor = UIColor.black
        return profileName
    }()
    private let statusSetField: UITextField = {
       let field = UITextField()
        field.placeholder = "Waiting for something..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.keyboardType = .default
        field.keyboardAppearance = .default
        field.returnKeyType = .default
        field.autocorrectionType = .yes
        return field
    }()
    private let showStatusButton: UIButton = {
       let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    private let statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Default status..."
        label.font = UIFont(name: "bold", size: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        statusSetField.delegate = self
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(profileImage)
        addSubview(profileName)
        addSubview(statusSetField)
        addSubview(showStatusButton)
        addSubview(statusLabel)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            profileImage.widthAnchor.constraint(equalToConstant: 120),
            profileImage.heightAnchor.constraint(equalToConstant: 120),
            profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            profileName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            
            statusSetField.heightAnchor.constraint(equalToConstant: 20),
            statusSetField.widthAnchor.constraint(equalToConstant: 200),
            statusSetField.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 50),
            statusSetField.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            
            statusLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 15),
            statusLabel.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15),
            
            showStatusButton.heightAnchor.constraint(equalToConstant: 50),
            showStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 16),
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        ])
    }
    @objc func buttonPressed() {
        statusLabel.text = statusSetField.text
        statusSetField.text = ""
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
