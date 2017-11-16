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
    var actorSelection: [Actor] = []
    var timeSelection: String = ""

    
    var isWatcher1: Bool = false
    var isWatcher2: Bool = false
    var willReset: Bool = false
    
    
    @IBOutlet weak var watcherBubble1: UIImageView!
    @IBOutlet weak var watcherBubble2: UIImageView!
    @IBOutlet weak var watcherButton1: UIButton!
    @IBOutlet weak var watcherButton2: UIButton!
    
    @IBAction func unwindToMainVC(segue:UIStoryboardSegue) { }

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Again, because the delegate is declared static in the TimePeriodVC, you need to assign the delegate here directly to the VC, and not to an instance.
        TimePeriodViewController.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
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
    
    func reset() {
        
       
        isWatcher1 = false
        isWatcher2 = false
        watcherBubble1.image = #imageLiteral(resourceName: "bubble-empty")
        watcherBubble2.image = #imageLiteral(resourceName: "bubble-empty")
        
        watcherButton1.isEnabled = true
        watcherButton2.isEnabled = true
        
        
        genreSelection = []
        actorSelection = []
        timeSelection = ""
  
        
        
        print("I have been reset!")
        willReset = false 
        
    }
    
    
}


//Conformed to the delegate in an extension. Makes the code a little cleaner.
extension ViewController: TimePeriodViewControllerDelegate {
    func watcherSelections(_: TimePeriodViewController, didSelectGenres genres: [GenreID], actors: [Actor], time: String, isWatcherOne: Bool) {
   
      
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
       // actorSelection.noDuplicates()
        //genreSelection.noDuplicates()
        
    }
}
