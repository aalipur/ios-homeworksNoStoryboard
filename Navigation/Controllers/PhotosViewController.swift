//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Анатолий Алипур on 25.03.2022.
//

import UIKit

protocol MyViewDelegate: AnyObject {
    func cellTapped()
}

class PhotosViewController: UIViewController {
    
    private let arrayOfImage = [
        CustomData(image: Image.alison), CustomData(image: Image.amatory2),
        CustomData(image: Image.amatory1), CustomData(image: Image.amy),
        CustomData(image: Image.architects), CustomData(image: Image.chem),
        CustomData(image: Image.coal), CustomData(image: Image.deftones),
        CustomData(image: Image.marvin), CustomData(image: Image.mister),
        CustomData(image: Image.hacktivist), CustomData(image: Image.shokran),
        CustomData(image: Image.sinatra), CustomData(image: Image.slipknot),
        CustomData(image: Image.halloats), CustomData(image: Image.king),
        CustomData(image: Image.korn), CustomData(image: Image.laura),
        CustomData(image: Image.northlane), CustomData(image: Image.ppk)
    ]
       
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .lightGray
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
    }
    //MARK: functions
    private func setupView() {
        view.addSubview(collectionView)
    }
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

//MARK: UICollectionViewDataSource
extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayOfImage.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as! PhotoCollectionViewCell
        cell.data = arrayOfImage[indexPath.item]
        return cell
    }
}
//MARK: UICollectionViewDelegate
extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private var sideInset: CGFloat { 8 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 3 == 0 {
            let width = collectionView.bounds.width - sideInset * 2
            return CGSize(width: width , height: width )
        }
        let width = (collectionView.bounds.width - sideInset * 3) / 2
        return CGSize(width: width , height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }
}

extension PhotosViewController: MyViewDelegate {
    func cellTapped() {
        self.navigationController?.pushViewController(PhotosViewController(), animated: true)
    }
    
    
    
}
