//
//  ViewController.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit
import Alamofire

class MainController: UICollectionViewController {
    
    private static let mainCellID = "mainCellID"
    
    var matches = [Match]()
    var allUpcomingMatchesHandler: (() -> ())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetup()
        fetchData()
    }
    
    func collectionViewSetup() {
        collectionView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        collectionView.register(MatchGroupCell.self, forCellWithReuseIdentifier: MainController.mainCellID)
    }
    
    func fetchData() {
        APIService.shared.newMatchesHappenningNow { [weak self] (cricModel) in
            cricModel?.matches[0..<10].forEach({ (match) in
                if match.team1 != "TBA" || match.team2 != "TBA" {
                    self?.matches.append(match)
                }
            })
            
            DispatchQueue.main.async {
                self?.collectionView.reloadData()
            }
        }
    }
}

extension MainController: UICollectionViewDelegateFlowLayout {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainController.mainCellID, for: indexPath) as! MatchGroupCell
        cell.horizontalMatchGroupsController.matches = self.matches
        cell.horizontalMatchGroupsController.collectionView.reloadData()
        cell.seeAllButton.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 20
        let height: CGFloat = 200
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    @objc func seeAllButtonTapped(button: UIButton) {
        let allUpcomingmatches = AllUpComingMatchesController()
        navigationController?.pushViewController(allUpcomingmatches, animated: true)
    }
    
}

