//
//  AllUpComingMatchesController.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit

class AllUpComingMatchesController: UITableViewController {
    
    private static let allMatchesCellID = "allMatchesCellID"
    
    var matches = [Match]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.tableFooterView = UIView()
//        tableView.separatorStyle = .none
//        tableView.allowsSelection = false
        
        tableView.register(AllMatchesTableCell.self, forCellReuseIdentifier: AllUpComingMatchesController.allMatchesCellID)
        
        APIService.shared.newMatchesHappenningNow { [weak self] (crickModal) in
            guard let matches = crickModal?.matches else {return}
            
            matches.forEach({ (match) in
                if match.team1 != "TBA" || match.team2 != "TBA" {
                    self?.matches.append(match)
                }
            })
            
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

extension AllUpComingMatchesController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return matches.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AllUpComingMatchesController.allMatchesCellID, for: indexPath) as! AllMatchesTableCell
        let match = self.matches[indexPath.row]
        cell.match = match
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 158
    }
}
