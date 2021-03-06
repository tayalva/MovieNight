//
//  ActorViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/16/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class ActorViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var actorArray: [Actor] = []
    var actorSelection: [Actor] = []
    var maxSelection: Int = 3
    var genreSelection: [GenreID] = []
    var isWatcher1: Bool = false 

    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        networkRequest()
      
    }
    
    
    let networkCall = NetworkManager()
    
    func networkRequest() {
        
        networkCall.fetchActor { (fetchedInfo, error) in
            
            
            if let fetchedInfo = fetchedInfo {
                
                self.actorArray = fetchedInfo

                
                OperationQueue.main.addOperation {
                    
                    self.tableView.reloadData()
                    
                }
                
                
            } else {
                
                   self.displayAlert("Whoops! Looks like the interwebs aren't there!", andMessage: "Check your netowrk settings and try starting over!")
                
                }
        }
    }
    

    
    
    @IBAction func nextButton(_ sender: Any) {
        
        

        performSegue(withIdentifier: "TimePeriodViewSegue", sender: nil)
        
    }
    

    func displayAlert(_ title: String, andMessage message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
            self.performSegue(withIdentifier: "unwindSegueToMainVC", sender: self)
          
            
        })
        
        alert.addAction(okAction)
        
        present(alert, animated: true, completion: nil)
    }
    
    
    
    
    
    // MARK: - Table view data source

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actorArray.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath) as! ActorViewCell
         self.tableView?.rowHeight = 75

        let item = actorArray[indexPath.row]
        
        cell.textLabel?.text = item.name
        
        if actorSelection.contains(item){
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
        } else { cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection") }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ActorViewCell
       
        
        if cell.selectionMark.image == #imageLiteral(resourceName: "EmptySelection") && maxSelection != 0 {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
            maxSelection -= 1
            actorSelection.append(actorArray[indexPath.row])
            
        } else if cell.selectionMark.image == #imageLiteral(resourceName: "SelectedCircle") {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection")
            maxSelection += 1
            actorSelection = actorSelection.filter {$0 != actorArray[indexPath.row]}
        }
        
        if maxSelection == 0 {
            nextButton.alpha = 1.0
            nextButton.isEnabled = true
        } else if maxSelection != 0 {
            nextButton.alpha = 0.30
            nextButton.isEnabled = false
        }
        
       
}
    
    
    
    
    // MARK: - Navigation


    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "TimePeriodViewSegue" {
            
            let vc = segue.destination as? TimePeriodViewController
            
            vc?.genreSelection = genreSelection
            vc?.actorSelection = actorSelection
            vc?.isWatcher1 = isWatcher1
            

        }
        
        if segue.identifier == "unwindSegueToMainVC" {
            
            let vc = segue.destination as? ViewController
            vc?.reset()
        }
    }


}
