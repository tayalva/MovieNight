//
//  ViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/8/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

var isWatcher1G: Bool = false
var isWatcher2G: Bool = false

class ViewController: UIViewController {

    
    var genreSelection: [GenreID] = []
    var actorSelection: [String] = []
    var timeSelection: String = ""

    
    var genreSelection2: [GenreID] = []
    var actorSelection2: [String] = []
    var timeSelection2: String = ""

    
    @IBOutlet weak var watcherBubble1: UIImageView!
    @IBOutlet weak var watcherBubble2: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
       let watcherOneSelections = WatcherOne(genre: genreSelection, actors: actorSelection, timePeriod: timeSelection)
        let watcherTwoSelections = WatcherTwo(genre: genreSelection2, actors: actorSelection2, timePeriod: timeSelection2)
        
        
        print(watcherOneSelections.actorSelection)
        print(watcherOneSelections.genreSelection)
        print(watcherOneSelections.timePeriod)
        
        print(watcherTwoSelections.actorSelection)
        print(watcherTwoSelections.genreSelection)
        print(watcherTwoSelections.timePeriod)
   
  
        
        
    }
    
    
    
    
    @IBAction func watcherButton1(_ sender: Any) {
        
        isWatcher1G = true
        isWatcher2G = false
    
   
        
    }
    
    @IBAction func watcherButton2(_ sender: Any) {
        
        isWatcher2G = true
        isWatcher1G = false 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenreViewSegue" {
            
           // let vc = segue.destination as? GenreViewController
            
        
      
            
            
        }
    }
    

}

