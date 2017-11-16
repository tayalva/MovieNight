//
//  ResultsViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 11/9/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    var genreSelection: [GenreID] = []
    var actorSelection: [String] = []
    var timeSelection: String = ""
    var genreSelection2: [GenreID] = []
    var actorSelection2: [String] = []
    var timeSelection2: String = ""
    
    var movieResults: [String] = []

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
  networkRequest()
     
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
    
    
    let networkCall = NetworkManager()
    
    func networkRequest() {
        
        networkCall.fetchGenre { (fetchedInfo, error) in
            
            
            if let fetchedInfo = fetchedInfo {
                
                let genre = fetchedInfo
                
                
                for movie in genre {
                    
                    self.movieResults.append(movie.title)
                }
                
                print(self.movieResults)
                
                OperationQueue.main.addOperation {
                    
                    self.tableView.reloadData()
                    
                }
                
                
            } else { print("nope") }
        }
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResults.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! ResultsViewCell
        
        self.tableView?.rowHeight = 75
        let item = movieResults[indexPath.row]
        
        cell.textLabel?.text = item
        
        return cell
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

    }
    

}
