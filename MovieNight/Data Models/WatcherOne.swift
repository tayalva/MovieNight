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
    var actorSelection: [Actor]
    var timePeriod: [ReleaseYear]

    
    
    init(genre: [GenreID], actors: [Actor], timePeriod: [ReleaseYear]) {
        
        
        self.genreSelection = genre
        self.actorSelection = actors
        self.timePeriod = timePeriod
    
    }
    
    
}





