//
//  Match.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import Foundation

struct CricketModal: Decodable {
    let matches: [Match]
    let v: String
    let ttl: Int
}

struct Match: Decodable {
    let unique_id: Int
    let date: String
    let dateTimeGMT: String
    let type: String
    var toss_winner_team: String?
    let matchStarted: Bool
    let team1: String
    let team2: String
    
    private enum CodingKeys: String, CodingKey {
        case unique_id, date, dateTimeGMT, type, toss_winner_team, matchStarted
        case team1 = "team-1"
        case team2 = "team-2"
    }
    
}
