//
//  ResultsViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 11/9/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    var genreSelection: [GenreID] = []
    var actorSelection: [String] = []
    var timeSelection: String = ""
    var genreSelection2: [GenreID] = []
    var actorSelection2: [String] = []
    var timeSelection2: String = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
     
        let watcherOne = WatcherOne(genre: genreSelection, actors: actorSelection, timePeriod: timeSelection)
        let watcherTwo = WatcherTwo(genre: genreSelection2, actors: actorSelection2, timePeriod: timeSelection2)
        
        
        
        print(watcherOne.actorSelection)
        print(watcherOne.genreSelection)
        print(watcherOne.timePeriod)
        print(watcherTwo.actorSelection)
        print(watcherTwo.genreSelection)
        print(watcherTwo.timePeriod)
    }
    
    
    @IBAction func startAgainButton(_ sender: Any) {

        dismiss(animated: true, completion: nil)
       
    }
    
    
    
    
    
    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let vc = segue.destination as? ViewController
        
        vc?.isWatcher1 = false
        vc?.isWatcher2 = false
        vc?.watcherBubble1.image = #imageLiteral(resourceName: "bubble-empty")
        vc?.watcherBubble2.image = #imageLiteral(resourceName: "bubble-empty")
        
        vc?.watcherButton1.isEnabled = true
       vc?.watcherButton2.isEnabled = true
        
        
        vc?.genreSelection = []
       vc?.actorSelection = []
        vc?.timeSelection = ""
        vc?.genreSelection2 = []
        vc?.actorSelection2 = []
        vc?.timeSelection2 = ""
        
        print("reset!")
    }
    
*/
}
