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
    var actorSelection: [Actor] = []
    var timeSelection: [ReleaseYear] = []

    
    var movieResults: [Movie] = []

    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        networkRequest()
     
       let watcherOne = WatcherOne(genre: genreSelection, actors: actorSelection, timePeriod: timeSelection)

//I have print statements here just to show in the console that the correct preferences the users chose are indeed being passed through
        print(watcherOne.actorSelection)
        print(watcherOne.genreSelection)
        print(watcherOne.timePeriod)


    }
    
    
    @IBAction func startAgainButton(_ sender: Any) {

        dismiss(animated: true, completion: nil)
       
    }
    
    
    let networkCall = NetworkManager()
    
    func networkRequest() {
        
        networkCall.fetchMovies(genres: genreSelection, actors: actorSelection, release: timeSelection) { (fetchedInfo, error) in
            
            
            if let fetchedInfo = fetchedInfo {
                
                self.movieResults = fetchedInfo
                
                
                OperationQueue.main.addOperation {
                    
                    self.tableView.reloadData()
                    
                }
                
                
            } else {
                
                self.displayAlert("Whoops! Looks like the interwebs aren't there!", andMessage: "Check your netowrk settings and try starting over!") 
                
            }
        }
    }
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieResults.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! ResultsViewCell
        
        self.tableView?.rowHeight = 75
        let item = movieResults[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        return cell
    }
    
    
    func displayAlert(_ title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
          self.dismiss(animated: true, completion: nil)
            
        })
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

    }
    

}
