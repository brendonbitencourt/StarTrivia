//
//  PersonAPI.swift
//  StarTrivia
//
//  Created by Brendon Bitencourt Braga on 2019-09-24.
//  Copyright © 2019 Brendon Bitencourt Braga. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class PersonAPI {
    
    func getRandomPersonAlamofireAndSwiftJSON(id: Int, completion: @escaping PersonReponseCompletion) {
        guard let url = URL(string: "\(Contants.PERSON_URL)\(id)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            guard let data = response.data else { return completion(nil) }
            do {
                let json = try JSON(data: data)
                let person = self.parsePersonSwiftJSON(json: json)
                completion(person)
            } catch {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
        }
    }
    
    func getRandomPersonAlamofire(id: Int, completion: @escaping PersonReponseCompletion) {
        guard let url = URL(string: "\(Contants.PERSON_URL)\(id)") else { return }
        Alamofire.request(url).responseJSON { (response) in
            if let error = response.result.error {
                debugPrint(error.localizedDescription)
                completion(nil)
            }
            guard let json = response.result.value as? [String: Any] else { return completion(nil) }
            let person = self.parsePersonManual(json: json)
            completion(person)
        }
    }
    
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
    
    fileprivate func parsePersonSwiftJSON(json: JSON) -> PersonModel {
        let name = json["name"].stringValue
        let height = json["height"].stringValue
        let mass = json["mass"].stringValue
        let hair = json["hair_color"].stringValue
        let birthYear = json["birth_year"].stringValue
        let gender = json["gender"].stringValue
        let homeworldUrl = json["homeworld"].stringValue
        let filmsUrls = json["films"].arrayValue.map({ $0.stringValue })
        let vehiclesUrls = json["vehicles"].arrayValue.map({ $0.stringValue })
        let starshipsUrls = json["starships"].arrayValue.map({ $0.stringValue })
       
       return PersonModel(name: name, height: height, mass: mass, hair: hair, birthYear: birthYear, gender: gender, homeworldUrl: homeworldUrl, filmsUrls: filmsUrls, vehiclesUrls: vehiclesUrls, starshipsUrls: starshipsUrls)
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
