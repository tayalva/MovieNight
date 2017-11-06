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

class ViewController: UIViewController, TimePeriodViewControllerDelegate {

    
    var genreSelection: [GenreID] = []
    var actorSelection: [String] = []
    var timeSelection: String = ""
    var isDone1: Bool = false
    var isDone2: Bool = false

    
    var genreSelection2: [GenreID] = []
    var actorSelection2: [String] = []
    var timeSelection2: String = ""
    

    
    @IBOutlet weak var watcherBubble1: UIImageView!
    @IBOutlet weak var watcherBubble2: UIImageView!
    @IBOutlet weak var watcherButton1: UIButton!
    @IBOutlet weak var watcherButton2: UIButton!
    
    

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      
        print("this is your time: \(timeSelection)")
       
        let watcherOneSelections = WatcherOne(genre: genreSelection, actors: actorSelection, timePeriod: timeSelection)
        let watcherTwoSelections = WatcherTwo(genre: genreSelection2, actors: actorSelection2, timePeriod: timeSelection2)
        
        if isDone1 == true {
            watcherBubble1.image = #imageLiteral(resourceName: "bubble-selected")
             watcherButton1.isEnabled = false
    
        
        } else {
            
            
            watcherBubble1.image = #imageLiteral(resourceName: "bubble-empty")
            watcherButton1.isEnabled = true
            
        }
        
        if isDone2 == true {
            
            watcherBubble2.image = #imageLiteral(resourceName: "bubble-selected")
            watcherButton2.isEnabled = false
        } else {
            
            watcherBubble2.image = #imageLiteral(resourceName: "bubble-empty")
                   watcherButton2.isEnabled = true
            
            
        }
        
     
        
        //print(watcherTwoSelections.actorSelection)
       // print(watcherTwoSelections.genreSelection)
        //print(watcherTwoSelections.timePeriod)
   
  
        
        
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
   
    }
    
    
    
    @IBAction func watcherButton1(_ sender: Any) {
        
        isWatcher1G = true
        isWatcher2G = false
    
        TimePeriodViewController().delegate = self
   
        
    }
    
    @IBAction func watcherButton2(_ sender: Any) {
        
        isWatcher2G = true
        isWatcher1G = false 
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? TimePeriodViewController {
            
            destination.delegate = self
        }
        
   
    }
    
    func actors(actors: [String]) {
        print("actors!")
        print(actors)
        actorSelection = actors
      
    }
    
    func genres(genres: [GenreID]) {
        
        genreSelection = genres
        
    }
    
    func time(timePeriod: String) {
        timeSelection = timePeriod
    }
    
    

}

