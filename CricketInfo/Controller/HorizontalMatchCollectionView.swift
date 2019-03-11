//
//  HorizontalMatchCollectionView.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class HorizontalMatchesCollectionView: UICollectionViewController {
    
    private static let horizontalRowCellID = "horizontalRowCellID"
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(collectionViewLayout: layout)
    }
    
    var matches: [Match]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
    }
    
    func collectionViewSetup() {
        collectionView.backgroundColor = .white
        collectionView.register(MatchCell.self, forCellWithReuseIdentifier: HorizontalMatchesCollectionView.horizontalRowCellID)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HorizontalMatchesCollectionView: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let matches = self.matches?.count {
            return matches
        } else {
            return 0
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HorizontalMatchesCollectionView.horizontalRowCellID, for: indexPath) as! MatchCell
        cell.match = self.matches?[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = view.frame.height - 20
        let width = view.frame.width - 40
        return CGSize(width: width, height: height)
    }
    
}
