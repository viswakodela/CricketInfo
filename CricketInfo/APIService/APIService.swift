//
//  APIService.swift
//  CricketInfo
//
//  Created by Viswa Kodela on 3/10/19.
//  Copyright © 2019 Viswa Kodela. All rights reserved.
//

import UIKit
import Alamofire

class APIService {
    
    static let shared = APIService()
    
    func newMatchesHappenningNow(completion: @escaping (CricketModal?) -> ()) {
        let apiKey = "jExTnDqLDIW16VK4qSpndHlG3Jf2"
        let url = "https://cricapi.com/api/matches?apikey=\(apiKey)"
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseData { (dataResponse) in
            guard let data = dataResponse.data else {return}
            
            let results = try? JSONDecoder().decode(CricketModal.self, from: data)
            completion(results)
        }
    }
    
}
