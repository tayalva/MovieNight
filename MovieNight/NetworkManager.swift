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
    var genreURL = "/genre/\(genreSelected.rawValue)/movies?"
    
    //this is temporary just to get it to fetch the data, i'll construct more in depth endpoints later
    let url = "https://api.themoviedb.org/3/genre/35/movies?api_key=cebcb7dc1f5b92102583ddea8808df00&sort_by=created_at.asc"
    
    func fetchGenre() {
        let apiUrl = URL(string: url)!
        
        URLSession.shared.dataTask(with: apiUrl) {
            (data, response, error) in
            
            
            guard let responseData = data else {
                print("no data!")
                return
            }

            let decoder = JSONDecoder()
            if let info = try? decoder.decode(Results.self, from: responseData){
                
                print(info.results)
            } else {
                
                print("Not Working!")
                
                
            //when this fails without an if let statement, it says something to the effect of getting an Int when wanting a string? 
            }
            
         
            
        } .resume()
        
     
        
 
        
        
        
    }
    
}






















