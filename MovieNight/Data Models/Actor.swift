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
    var popularity: Double
    
}
