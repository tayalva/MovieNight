//
//  WatcherOne.swift
//  MovieNight
//
//  Created by Taylor Smith on 11/2/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


//I originally had WatcherOne and WatcherTwo, but then realized I didn't need 2 objects, and just combined both users selections into 1 object, which is used to display the final set of movies. Instead of changing WatcherOne to something like Watcher, I left it as WatcherOne

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





