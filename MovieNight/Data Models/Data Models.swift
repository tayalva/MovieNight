//
//  Data Models.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/9/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


enum GenreID: Int {
    
    case Action = 28
    case Adventure = 12
    case Animation = 16
    case Comedy = 35
    case Crime = 80
    case Documentary = 99
    case Drama = 18
    case Family = 10751
    case Fantasy = 14
    case History = 36
    case Horror = 27
    case Music = 10402
    case Mystery = 9648
    case Romance = 10749
    case ScienceFiction = 878
    case TVmovie = 10770
    case Thriller = 53
    case War = 10752
    case Western = 37
    
    static let allValues = [Action, Adventure, Animation, Comedy, Crime, Documentary, Drama, Family, Fantasy, History, Horror, Music, Mystery, Romance, ScienceFiction, TVmovie, Thriller, War, Western]
    
    
    enum CodingKeys: String, CodingKey {
        
        case ScienceFiction = "Science Fiction"
        case TVmovie = "TV Movie"
        
    }
    
}

enum ReleaseYear: Int {
    
    case Seventeen = 2017
    case Sixteen = 2016
    case Fifteen = 2015
    case Fourteen = 2014
    case Thirteen = 2013
    case Twelve = 2012
    case Eleven = 2011
    case Ten = 2010
    case Nine = 2009
    case Eight = 2008
    case Seven = 2007
    
    static let allValues = [Seventeen, Sixteen, Fifteen, Fourteen, Thirteen, Twelve, Eleven, Ten, Nine, Eight, Seven]
    
}

// in case I needed to filter out duplicate entries

extension Array where Element: Equatable {
    
    mutating func noDuplicates() {
        
        var uniqueElements:[Element] = []
        
        for element in self {
            
            if !uniqueElements.contains ( element ) {
                
                uniqueElements.append(element)
            }
        }
        
        self = uniqueElements
    }
    
}


enum MovieError {
    
    case invalidData
}
