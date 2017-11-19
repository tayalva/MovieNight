//
//  ViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/8/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    var genreSelection: [GenreID] = []
    var actorSelection: [Actor] = []
    var timeSelection: [ReleaseYear] = []
    
    var isWatcher1: Bool = false
    var isWatcher2: Bool = false
    var willReset: Bool = false
    
    
    @IBOutlet weak var watcherBubble1: UIImageView!
    @IBOutlet weak var watcherBubble2: UIImageView!
    @IBOutlet weak var watcherButton1: UIButton!
    @IBOutlet weak var watcherButton2: UIButton!
    @IBOutlet weak var resultsButton: UIButton!
    
    
  //unwind segue
    @IBAction func unwindToMainVC(segue:UIStoryboardSegue) { }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset()
        TimePeriodViewController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if watcherBubble1.image == #imageLiteral(resourceName: "bubble-selected") && watcherBubble2.image == #imageLiteral(resourceName: "bubble-selected") {
            
            resultsButton.isEnabled = true
            resultsButton.alpha = 1
        }
        
// calls the reset method which resets all values to 0
        
        if willReset == true {
            
            reset()
        }
    }
    
    @IBAction func watcherButton1(_ sender: Any) {
        isWatcher1 = true
        performSegue(withIdentifier: "GenreViewSegue", sender: nil)
    }
    
    @IBAction func watcherButton2(_ sender: Any) {
        isWatcher1 = false
         performSegue(withIdentifier: "GenreViewSegue", sender: nil)
    }
    
    @IBAction func resultsButton(_ sender: Any) {
        
        willReset = true
        performSegue(withIdentifier: "ResultsViewSegue", sender: nil)
        
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GenreViewSegue" {
            
            let vc = segue.destination as? GenreViewController
            
            vc?.isWatcher1 = isWatcher1
            
            
        }
        
        if segue.identifier == "ResultsViewSegue" {
            
            let vc = segue.destination as? ResultsViewController
            
            vc?.actorSelection = actorSelection
            vc?.genreSelection = genreSelection
            vc?.timeSelection = timeSelection
   
        }
    }
// reset function that resets all values to 0
    
    func reset() {
        
       
        isWatcher1 = false
        isWatcher2 = false
        watcherBubble1.image = #imageLiteral(resourceName: "bubble-empty")
        watcherBubble2.image = #imageLiteral(resourceName: "bubble-empty")
        
        watcherButton1.isEnabled = true
        watcherButton2.isEnabled = true
        resultsButton.isEnabled = false
        resultsButton.alpha = 0.3
        
        genreSelection = []
        actorSelection = []
        timeSelection = []
  
        
        
        print("I have been reset!")
        willReset = false 
        
    }
    
    
}


// delegate conformation to pass data back to the main vc after selections have been made

extension ViewController: TimePeriodViewControllerDelegate {
    func watcherSelections(_: TimePeriodViewController, didSelectGenres genres: [GenreID], actors: [Actor], time: [ReleaseYear], isWatcherOne: Bool) {
   
      
        isWatcher1 = isWatcherOne
        
        
        if isWatcherOne {
            
          
            watcherBubble1.image = #imageLiteral(resourceName: "bubble-selected")
            watcherButton1.isEnabled = false

            
        } else {
        
            watcherBubble2.image = #imageLiteral(resourceName: "bubble-selected")
            watcherButton2.isEnabled = false
        }
        
        actorSelection.append(contentsOf: actors)
        genreSelection.append(contentsOf: genres)
        timeSelection.append(contentsOf: time)
        
    
 
        
    }
}
