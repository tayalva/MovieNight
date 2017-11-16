//
//  Actor.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/16/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import Foundation


struct ActorResults: Codable {
    
    var results: [Actor]
    
}


struct Actor: Codable {
    
    var name: String
    var id: Int
    var popularity: Double
    
}

extension Actor: Equatable {
    
    static func == (lhs: Actor, rhs: Actor) -> Bool {
        
        return lhs.name == rhs.name && lhs.id == rhs.id && lhs.popularity == rhs.popularity
        
    }
    
    
    
}
