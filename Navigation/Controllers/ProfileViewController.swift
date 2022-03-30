//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let avatarImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.image = UIImage(named: "vorratokon")
        imageView.contentMode = UIView.ContentMode.scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isUserInteractionEnabled = true
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
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(PhotoTableViewCell.self, forCellReuseIdentifier: String.init(describing: PhotoTableViewCell.self))
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    //MARK: viewController lifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupTable()
        setupConstraints()
        setupGesture()
    }
    override func viewWillLayoutSubviews() {
        
    }
    //MARK: functions
    private func setupView() {
        title = "Profile"
        view.backgroundColor = .lightGray
        [avatarImageView, fullNameLabel, statusTextField, setStatusButton, statusLabel, tableView].forEach{ view.addSubview($0) }
    }
    private func setupTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    //MARK: gesture
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAction))
        avatarImageView.addGestureRecognizer(tapGesture)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatarImageView.widthAnchor.constraint(equalToConstant: 120),
            avatarImageView.heightAnchor.constraint(equalToConstant: 120),
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            statusTextField.heightAnchor.constraint(equalToConstant: 20),
            statusTextField.widthAnchor.constraint(equalToConstant: 200),
            statusTextField.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 50),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 15),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 15),
            
            tableView.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 20),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 150),
            
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            setStatusButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            setStatusButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
        ])
    }
    //MARK: @objc functions
    @objc private func tapAction() {
        //let tappedImage =
        print("Tap")
        let positionAnimation = CABasicAnimation(keyPath: #keyPath(CALayer.position))
        positionAnimation.fromValue = avatarImageView.centerYAnchor
        positionAnimation.toValue = CGPoint(x: view.center.x, y: view.center.y)
        
    }
    @objc private func buttonPressed() {
        statusLabel.text = statusTextField.text
        statusTextField.text = ""
    }
}
//MARK: extensions
extension ProfileViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
}
extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String.init(describing: PhotoTableViewCell.self), for: indexPath) as! PhotoTableViewCell
        return cell
    }
}
