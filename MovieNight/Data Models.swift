//
//  Data Models.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/9/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation



enum GenreID: String {
    
    case Action = "28"
    case Adventure = "12"
    case Animation = "16"
    case Comedy = "35"
    case Crime = "80"
    case Documentary = "99"
    case Drama = "18"
    case Family = "10751"
    case Fantasy = "14"
    case History = "36"
    case Horror = "27"
    case Music = "10402"
    case Mystery = "9648"
    case Romance = "10749"
    case ScienceFiction = "878"
    case TVmovie = "10770"
    case Thriller = "53"
    case War = "10752"
    case Western = "37"
    
}

enum MovieError {
    
    case invalidData
}
