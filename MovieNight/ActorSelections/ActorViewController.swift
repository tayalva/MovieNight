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
        return 20
    }
    
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "actorCell", for: indexPath) as! ActorTableViewCell
        
        
        
        cell.textLabel?.text = actorArray[indexPath.row]
        
        return cell
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
