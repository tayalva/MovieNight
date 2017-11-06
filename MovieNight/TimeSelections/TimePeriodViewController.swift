//
//  TimePeriodViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/16/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

protocol TimePeriodViewControllerDelegate: class {
    
    //Streamlined the delegate method, so all data is passed at once instead of three different methods
    
    func timePeriodViewController(_: TimePeriodViewController, didSelectGenres genres: [GenreID], actors: [String], time: String)
}

class TimePeriodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var timePeriodArray: [String] = ["90's", "2000's", "2010's", "Now Playing"]
    var maxSelection = 1
    
    var timeSelection = ""
    var genreSelection: [GenreID] = []
    var actorSelection: [String] = []
    var isWatcher1: Bool = false
    var isWatcher2: Bool = false
    
    
    //Added static keyword, so you don't rely on a specific instance of the VC anymore
    static weak var delegate: TimePeriodViewControllerDelegate?
    
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
 

 
    }
    
// Hey Dan! This is where I'm assigning the user's selections to the delegate. This button also segues back to the main VC. I have print statements for those arrays just to make sure the info is in fact there, so I know my data is being passed. 
    
    @IBAction func finishButton(_ sender: Any) {
        
        
        //Because the delegate is now declared static you need to call it on the VC itself
        TimePeriodViewController.delegate?.timePeriodViewController(_: self, didSelectGenres: genreSelection, actors: actorSelection, time: timeSelection)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timePeriodArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
        
        cell.textLabel?.text = timePeriodArray[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! TimePeriodViewCell
        
        if cell.selectionMark.image == #imageLiteral(resourceName: "EmptySelection") && maxSelection != 0 {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
            maxSelection -= 1
            timeSelection = timePeriodArray[indexPath.row]
            
        } else if cell.selectionMark.image == #imageLiteral(resourceName: "SelectedCircle") {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection")
            maxSelection += 1
            timeSelection = ""
        }
        
        if maxSelection == 0 {
            finishButton.alpha = 1.0
            finishButton.isEnabled = true
        } else if maxSelection != 0 {
            finishButton.alpha = 0.30
            finishButton.isEnabled = false
        }
        
    
    }
    


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
   /* override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "MainViewSegue" {
            
            let vc = segue.destination as? ViewController
            
            if isWatcher1G == true {
            vc?.genreSelection = genreSelection
            vc?.actorSelection = actorSelection
            vc?.timeSelection = timeSelection
            vc?.isDone1 = true
                
                
                
            } else if isWatcher2G == true {
                
                vc?.genreSelection2 = genreSelection
                vc?.actorSelection2 = actorSelection
                vc?.timeSelection2 = timeSelection
                vc?.isDone2 = true
                
                
            }
            
            print(isWatcher1G)
        }
        
        
    }
*/

}
