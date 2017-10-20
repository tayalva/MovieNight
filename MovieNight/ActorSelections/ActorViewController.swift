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
    
    var actorArray: [String] = []
    var actorSelection: [String] = []
    var maxSelection: Int = 3
    
    @IBOutlet weak var nextButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        networkRequest()
      
    }
    
    
    let networkCall = NetworkManager()
    
    func networkRequest() {
        
        networkCall.fetchActor { (fetchedInfo, error) in
            
            
            if let fetchedInfo = fetchedInfo {
                
                let actor = fetchedInfo
                
                for actor in actor {
                    
                    self.actorArray.append(actor.name)
                }
                
                
                
                print(self.actorArray)
                
                
                OperationQueue.main.addOperation {
                    
                    self.tableView.reloadData()
                    
                }
                
                
            } else { print("nope") }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return actorArray.count
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath) as! ActorViewCell
        
        let item = actorArray[indexPath.row]
        
        cell.textLabel?.text = item
        
        if actorSelection.contains(item) {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
        } else { cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection") }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ActorViewCell
        print(indexPath)
        
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
        
        print(actorSelection)
}
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
