//
//  MatchesCell.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class MatchGroupCell: UICollectionViewCell {
    
    let horizontalMatchGroupsController = HorizontalMatchesCollectionView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    let currentMatches: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "UP-COMING MATCHES"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    let seeAllButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("See All", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        return button
    }()
    
    func setupLayout() {
        backgroundColor = .white
        layer.cornerRadius = 4
        guard let collectionView = horizontalMatchGroupsController.view else {return}
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(seeAllButton)
        seeAllButton.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        seeAllButton.heightAnchor.constraint(equalToConstant: 44).isActive = true
        seeAllButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
        
        addSubview(currentMatches)
        currentMatches.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        currentMatches.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        currentMatches.trailingAnchor.constraint(equalTo: seeAllButton.leadingAnchor, constant: -10).isActive = true
        currentMatches.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: currentMatches.bottomAnchor, constant: 4).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
