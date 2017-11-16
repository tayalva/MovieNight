//
//  Movie.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/9/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation

struct Results: Codable {
    

    var results: [Movie]
    
}



struct Movie: Codable {
    
    var title: String
    var overview: String
    var genres: [Int]
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        
        case title
        case overview
        case genres = "genre_ids"
        case releaseDate = "release_date"
    }
    
    
}



