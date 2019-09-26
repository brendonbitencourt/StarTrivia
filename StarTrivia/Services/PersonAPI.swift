//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-24.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import Foundation

class PersonAPI {
    
    func getRandomPersonUrlSession(id: Int, completion: @escaping PersonReponseCompletion) {
        guard let url = URL(string: "\(Contants.PERSON_URL)\(id)") else { return }
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard error == nil else {
                debugPrint(error.debugDescription)
                DispatchQueue.main.async { completion(nil) }
                return
            }
            guard let data = data else { return }
            do {
                let jsonData = try JSONSerialization.jsonObject(with: data, options: [])
                guard let json = jsonData as? [String: Any] else { return }
                let person = self.parsePersonManual(json: json)
                DispatchQueue.main.async { completion(person) }
            } catch {
                debugPrint(error.localizedDescription)
                DispatchQueue.main.async { completion(nil) }
                return
            }
        }
        task.resume()
    
    }
    
    fileprivate func parsePersonManual(json: [String: Any]) -> PersonModel {
        let name = json["name"] as? String ?? ""
        let height = json["height"] as? String ?? ""
        let mass = json["mass"] as? String ?? ""
        let hair = json["hair_color"] as? String ?? ""
        let birthYear = json["birth_year"] as? String ?? ""
        let gender = json["gender"] as? String ?? ""
        let homeworldUrl = json["homeworld"] as? String ?? ""
        let filmsUrls = json["films"] as? [String] ?? [""]
        let vehiclesUrls = json["vehicles"] as? [String] ?? [""]
        let starshipsUrls = json["starships"] as? [String] ?? [""]
        
        return PersonModel(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmsUrls: filmsUrls, vehiclesUrls: vehiclesUrls, starshipsUrls: starshipsUrls)
    }
    
}
