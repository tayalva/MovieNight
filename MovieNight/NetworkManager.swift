//
//  NetworkManager.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/8/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation
var genreSelected: GenreID = .Comedy

class NetworkManager {
    
    
    
    var baseURL = "https://api.themoviedb.org/3/"
    var apiKey = "api_key=cebcb7dc1f5b92102583ddea8808df00"
  
    func fetchGenre(completion: @escaping ([Movie]?, MovieError?)-> Void) {
        
        
        let url = "\(baseURL)genre/35/movies?\(apiKey)&sort_by=created_at.asc"

        let apiUrl = URL(string: url)!
        
        URLSession.shared.dataTask(with: apiUrl) {
            (data, response, error) in
            
            guard let responseData = data else {
                print("no data!")
                completion(nil, .invalidData)
                return
            }

            let decoder = JSONDecoder()
            if let movieArray = try? decoder.decode(Results.self, from: responseData){
              
                completion(movieArray.results, nil)
                
                
            } else {
                
                print("not decoded properly")
            }
            
         
            
        } .resume()
    }
    
////////////////////////////////////////////////////////////
    
    func fetchActor(completion: @escaping ([Actor]?, MovieError?)-> Void) {
        
        
        let url = "\(baseURL)person/popular?\(apiKey)&sort_by=created_at.asc"
        
        let apiUrl = URL(string: url)!
        
        URLSession.shared.dataTask(with: apiUrl) {
            (data, response, error) in
            
            guard let responseData = data else {
                print("no data!")
                completion(nil, .invalidData)
                return
            }
            
            let decoder = JSONDecoder()
            if let actorArray = try? decoder.decode(ActorResults.self, from: responseData){
                print(actorArray)
                completion(actorArray.results, nil)
                
                
            } else {
                
                print("not decoded properly")
            }
            
            
            
            } .resume()
    
    
    
    }
    
    
    
    
    
}






















