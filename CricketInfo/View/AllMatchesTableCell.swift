//
//  AllMatchesTableCell.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AllMatchesTableCell: UITableViewCell {
    
    var match: Match? {
        didSet {
            team1NameLabel.text = match?.team1
            team2NameLabel.text = match?.team2
            
            guard let dateString = match?.dateTimeGMT else {return}
            let dateFormatter = DateFormatter()
            dateFormatter.locale = Locale(identifier: "en_US_POSIX")
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            let date = dateFormatter.date(from: dateString)
            print(date)
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    let team1ImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let team1NameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let team2ImageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    let team2NameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    func setupLayout() {
        
        let team1StackView = UIStackView(arrangedSubviews: [team1ImageView, team1NameLabel])
        team1StackView.translatesAutoresizingMaskIntoConstraints = false
        team1StackView.spacing = 10
        team1StackView.axis = .horizontal
        team1StackView.backgroundColor = .blue
        
        let team2StackView = UIStackView(arrangedSubviews: [team2ImageView, team2NameLabel])
        team2StackView.translatesAutoresizingMaskIntoConstraints = false
        team2StackView.spacing = 10
        team2StackView.axis = .horizontal
        
        let overallStackView = UIStackView(arrangedSubviews: [team1StackView, team2StackView])
        overallStackView.translatesAutoresizingMaskIntoConstraints = false
        overallStackView.spacing = 10
        overallStackView.axis = .vertical
        
        team1ImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        team1ImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        team2ImageView.widthAnchor.constraint(equalToConstant: 44).isActive = true
        team2ImageView.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        addSubview(overallStackView)
        overallStackView.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        overallStackView.heightAnchor.constraint(equalToConstant: 98).isActive = true
        overallStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        overallStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        
        addSubview(timeLabel)
        timeLabel.topAnchor.constraint(equalTo: overallStackView.bottomAnchor, constant: 8).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
