//
//  WatcherTwo.swift
//  MovieNight
//
//  Created by Taylor Smith on 11/2/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation



class WatcherTwo {
    
    var genreSelection: [GenreID]
    var actorSelection: [Actor]
    var timePeriod: String
    
    
    init(genre: [GenreID], actors: [Actor], timePeriod: String) {
        
        
        self.genreSelection = genre
        self.actorSelection = actors
        self.timePeriod = timePeriod
    }
    
    
}
