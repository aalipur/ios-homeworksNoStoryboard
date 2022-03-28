//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Анатолий Алипур on 05.03.2022.
//

import Foundation
import UIKit

class ProfileHeaderView: UIView {
    
    private let avatarImageView: UIImageView = {
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
    private let fullNameLabel: UILabel = {
       let profileName = UILabel()
        profileName.text = "Hipster Cat"
        profileName.font = UIFont(name: "bold", size: 18)
        profileName.translatesAutoresizingMaskIntoConstraints = false
        profileName.textColor = UIColor.black
        return profileName
    }()
    private let statusTextField: UITextField = {
       let field = UITextField()
        field.placeholder = "Waiting for something..."
        field.translatesAutoresizingMaskIntoConstraints = false
        field.layer.cornerRadius = 6
        field.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: field.frame.height))
        field.leftViewMode = .always
        field.keyboardType = .default
        field.keyboardAppearance = .default
        field.returnKeyType = .default
        field.autocorrectionType = .yes
        field.backgroundColor = .white
        return field
    }()
    private lazy var setStatusButton: UIButton = {
       let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 4
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
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PhotoTableViewCell.self, forCellReuseIdentifier: String.init(describing: PhotoTableViewCell.self))
        table.rowHeight = UITableView.automaticDimension
        table.estimatedRowHeight = 50
        table.dataSource = self
        table.delegate = self
        return table
    }()
    weak var delegate: MyViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .lightGray
        statusTextField.delegate = self
        setupViews()
        setupConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusTextField)
        addSubview(setStatusButton)
        addSubview(statusLabel)
        addSubview(tableView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 20),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 50),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            tableView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 116),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
        ])
    }
    @objc func buttonPressed() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
    }
}

extension ProfileHeaderView: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
//MARK: extensions
extension ProfileHeaderView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.cellTapped()
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
}
extension ProfileHeaderView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: PhotoTableViewCell.self), for: indexPath) as! PhotoTableViewCell
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}
