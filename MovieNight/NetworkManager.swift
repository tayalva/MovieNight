//
//  NetworkManager.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/8/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation
import UIKit


class NetworkManager {
    
    
    
    var baseURL = "https://api.themoviedb.org/3/"
    var apiKey = "api_key=cebcb7dc1f5b92102583ddea8808df00"
    
    
// network request to fetch genre's. I don't actually use this, as I made an enum of set genre's from the API. but I left here just in case i needed to call it
    
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
  // network call to fetch the most popular actors
    
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
             
                completion(actorArray.results, nil)
                
                
            } else {
                
                print("not decoded properly")
            }
            
            
            
            } .resume()
    
    }
    
 ///////////////////////////////////////////////////////
//this is the final endpoint/network call that accepts the users preferences 
    
    func fetchMovies(genres: [GenreID], actors: [Actor], release: [ReleaseYear], completion: @escaping ([Movie]?, MovieError?)-> Void) {
        
        
        

        
        let url = "\(baseURL)discover/movie?\(apiKey)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_cast=\(actors[0].id)%7C\(actors[1].id)%7C\(actors[2].id)%7C\(actors[3].id)%7C\(actors[4].id)%7C\(actors[5].id)&with_genres=\(genres[0].rawValue)%7C\(genres[1].rawValue)%7C\(genres[2].rawValue)%7C\(genres[3].rawValue)%7C\(genres[4].rawValue)%7C\(genres[5].rawValue)&year=\(release[0].rawValue)%7C\(release[1].rawValue)"
        
        
        print(url)
        let apiUrl = URL(string: url)!
        
        URLSession.shared.dataTask(with: apiUrl) {
            (data, response, error) in
            
            guard let response = response else {
                
                print("network error!")
                completion(nil, .invalidData)
                return
            }
            
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
    
    
    

    
    
}






















