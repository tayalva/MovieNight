//
//  WatcherOne.swift
//  MovieNight
//
//  Created by Taylor Smith on 11/2/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation



class WatcherOne {
    
    var genreSelection: [GenreID]
    var actorSelection: [String]
    var timePeriod: String

    
    
    init(genre: [GenreID], actors: [String], timePeriod: String) {
        
        
        self.genreSelection = genre
        self.actorSelection = actors
        self.timePeriod = timePeriod
    
    }
    
    
}





