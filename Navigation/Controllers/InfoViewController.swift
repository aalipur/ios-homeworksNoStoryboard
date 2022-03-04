//
//  InfoViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 26.02.2022.
//

import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Info view"
        view.backgroundColor = .systemGray5
        button()
    }
    
    func button() {
        let button = UIButton(frame: CGRect(x: 100, y: 50, width: 160, height: 50))
        view.addSubview(button)
        button.setTitle("Show alert", for: .normal)
        button.backgroundColor = .red
        button.center = view.center
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(self, action: #selector(showAlertController), for: .touchUpInside)
    }
    @objc func showAlertController() {
        let alert = UIAlertController(title: "This is an alert", message: "Stay cool!", preferredStyle: .alert)
        let calmButton = UIAlertAction(title: "Stay cool!", style: .default, handler: {_ in print("I'm cool!")})
        let crazyButton = UIAlertAction(title: "Go crazy!!", style: .destructive, handler: {_ in print("Crazy!")})
        alert.addAction(crazyButton)
        alert.addAction(calmButton)
        present(alert, animated: true, completion: nil)
    }
}
