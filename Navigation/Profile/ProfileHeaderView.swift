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
        profileName.textColor = UIColor.black
        return profileName
    }()
    private let statusSetField: UITextField = {
       let field = UITextField()
        field.returnKeyType = .done
        field.autocorrectionType = .yes
        //field.delegate = field.self
        return field
    }()
    private let showStatusButton: UIButton = {
       let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews() {
        self.addSubview(profileImage)
        addSubview(profileName)
        addSubview(statusSetField)
        addSubview(showStatusButton)
    }
    func setupConstraints() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        
        profileImage.translatesAutoresizingMaskIntoConstraints = false
        profileImage.widthAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.heightAnchor.constraint(equalToConstant: 120).isActive = true
        profileImage.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        profileImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        profileImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27).isActive = true
        profileName.leadingAnchor.constraint(equalTo: profileImage.trailingAnchor, constant: 15).isActive = true
        
        statusSetField.translatesAutoresizingMaskIntoConstraints = false
        statusSetField.topAnchor.constraint(equalTo: profileName.bottomAnchor, constant: 34).isActive = true
        statusSetField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: 34).isActive = true
        
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //showStatusButton.widthAnchor.constraint(equalToConstant: 370).isActive = true
        showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16).isActive = true
        showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16).isActive = true
        showStatusButton.topAnchor.constraint(equalTo: profileImage.bottomAnchor, constant: 10).isActive = true
    }
    @objc func buttonPressed() {
        print("\(profileName.text ?? "Error: profileName.text")")
    }
}

/*extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        statusSetField.resignFirstResponder()
        return true
    }
}*/
