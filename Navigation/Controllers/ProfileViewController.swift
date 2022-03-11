//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private let profileHeader: ProfileHeaderView = {
        let profileHeader = ProfileHeaderView()
        return profileHeader
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.addSubview(profileHeader)
    }
    override func viewWillLayoutSubviews() {
        profileHeader.frame = self.view.frame
    }
}
