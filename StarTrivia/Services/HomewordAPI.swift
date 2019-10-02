//
//  HomewordAPI.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-10-01.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import Foundation
import Alamofire

class HomewordAPI {
    
    func getHomewordAlamofireAndCodable(url: String, completion: @escaping HomewordResponseCompletion) {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            guard let data = response.data else { return completion(nil) }
            do {
                let homeword = try JSONDecoder().decode(HomewordModel.self, from: data)
                completion(homeword)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }

        }
    }
    
}
