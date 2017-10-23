//
//  TimePeriodViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/16/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class TimePeriodViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var timePeriodArray: [String] = ["90's", "2000's", "2010's", "Now Playing"]
    var maxSelection = 1
    var timeSelection = ""
    

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var finishButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        print(indexPath)
        
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
        
        print(timeSelection)
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
