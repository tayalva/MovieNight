//
//  TimePeriodViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/16/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

// delegate method that sends final info back to the main VC

protocol TimePeriodViewControllerDelegate: class {
    
    
    
    func watcherSelections(_: TimePeriodViewController, didSelectGenres genres: [GenreID], actors: [Actor], time: [ReleaseYear], isWatcherOne: Bool)
}

class TimePeriodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var timePeriodArray: [ReleaseYear] = [.Seventeen, .Sixteen, .Fifteen, .Fourteen, .Thirteen, .Twelve, .Eleven, .Ten, .Nine, .Eight, .Seven]
    var maxSelection = 1
    
    var timeSelection: [ReleaseYear] = []
    var genreSelection: [GenreID] = []
    var actorSelection: [Actor] = []
    var isWatcher1: Bool = false
    var isWatcher2: Bool = false

    static weak var delegate: TimePeriodViewControllerDelegate?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func finishButton(_ sender: Any) {

        TimePeriodViewController.delegate?.watcherSelections(_: self, didSelectGenres: genreSelection, actors: actorSelection, time: timeSelection, isWatcherOne: isWatcher1)
        performSegue(withIdentifier: "unwindSegueToMainVC", sender: self)
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timePeriodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
         self.tableView?.rowHeight = 75
        cell.textLabel?.text = "\(timePeriodArray[indexPath.row].rawValue)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TimePeriodViewCell
       
        if cell.selectionMark.image == #imageLiteral(resourceName: "EmptySelection") && maxSelection != 0 {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
            maxSelection -= 1
            timeSelection = [timePeriodArray[indexPath.row]]
            
        } else if cell.selectionMark.image == #imageLiteral(resourceName: "SelectedCircle") {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection")
            maxSelection += 1
            timeSelection = []
        }
        
        if maxSelection == 0 {
            finishButton.alpha = 1.0
            finishButton.isEnabled = true
        } else if maxSelection != 0 {
            finishButton.alpha = 0.30
            finishButton.isEnabled = false
        }
        
    
    }
    

}
