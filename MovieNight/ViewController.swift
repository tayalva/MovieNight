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
    var isDone1: Bool = false
    var isDone2: Bool = false

    
    var genreSelection2: [GenreID] = []
    var actorSelection2: [String] = []
    var timeSelection2: String = ""
    

    
    @IBOutlet weak var watcherBubble1: UIImageView!
    @IBOutlet weak var watcherBubble2: UIImageView!
    @IBOutlet weak var watcherButton1: UIButton!
    @IBOutlet weak var watcherButton2: UIButton!
    
    @IBAction func unwindToMainVC(segue:UIStoryboardSegue) { }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Again, because the delegate is declared static in the TimePeriodVC, you need to assign the delegate here directly to the VC, and not to an instance.
        TimePeriodViewController.delegate = self
      
     
       
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
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
   
    }
    
    
    
    @IBAction func watcherButton1(_ sender: Any) {
        
        isWatcher1G = true
        isWatcher2G = false
        
        performSegue(withIdentifier: "GenreViewSegue", sender: nil)
    }
    
    @IBAction func watcherButton2(_ sender: Any) {
        
        isWatcher2G = true
        isWatcher1G = false
         performSegue(withIdentifier: "GenreViewSegue", sender: nil)
    }
}


//Conformed to the delegate in an extension. Makes the code a little cleaner.
extension ViewController: TimePeriodViewControllerDelegate {
    func timePeriodViewController(_: TimePeriodViewController, didSelectGenres genres: [GenreID], actors: [String], time: String) {
        print(genres)
        print(actors)
        print(time)
        
        actorSelection = actors
        genreSelection = genres
        timeSelection = time
    }
}
