//
//  GenreTableTableViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/12/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class GenreTableTableViewController: UITableViewController {
    

    
    
    var maxSelection = 3
    var movieArray: [String] = []
    var genreStringArray: [String] = []
    var genreArray: [GenreID] = []
    var genreSelectionArray: [GenreID] = []
    
    func makeGenreArray() {
        
    for x in GenreID.allValues {
    
    genreStringArray.append("\(x)")
    genreArray.append(x)
    }
        
        if genreStringArray.contains("ScienceFiction") {
            let index = genreStringArray.index(of: "ScienceFiction")
            genreStringArray[index!] = "Science Fiction"
        }
        if genreStringArray.contains("TVmovie") {
            let index = genreStringArray.index(of: "TVmovie")
            genreStringArray[index!] = "TV Movie"
        }
        
        

    
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        navigationController?.navigationBar.barTintColor = UIColor(red: 91/255.0, green: 184/255.0, blue: 222/255.0, alpha: 1)
        networkRequest()
        
        

    }
    
    let networkCall = NetworkManager()
    
    func networkRequest() {
        
        networkCall.fetchGenre { (fetchedInfo, error) in
            
            
            if let fetchedInfo = fetchedInfo {
                
                let movie = fetchedInfo
                
                for movie in movie {
                    
                    self.movieArray.append(movie.title)
                }
                
                
            
          print(self.movieArray)
                self.makeGenreArray()
                
                OperationQueue.main.addOperation {
                    
                     self.tableView.reloadData()
                    
                }
               
        
            } else { print("nope") }
        }
    }
    
    @IBAction func nextButton(_ sender: UIBarButtonItem) {
        
        print("next")
    }
    


    // MARK: - Table view data source



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
            return genreStringArray.count
     
    }



    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as! GenreTableViewCell

       cell.textLabel?.text = genreStringArray[indexPath.row]
        cell.imageView?.image = #imageLiteral(resourceName: "EmptySelection")
       
   
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(genreStringArray[indexPath.row])
        
        let cell = tableView.cellForRow(at: indexPath)
    
   
        if cell?.imageView?.image == #imageLiteral(resourceName: "EmptySelection") && maxSelection != 0 {
            
        cell?.imageView?.image = #imageLiteral(resourceName: "SelectedCircle")
           maxSelection -= 1
            genreSelectionArray.append(genreArray[indexPath.row])
            
        } else if cell?.imageView?.image == #imageLiteral(resourceName: "SelectedCircle") {
            
            cell?.imageView?.image = #imageLiteral(resourceName: "EmptySelection")
            maxSelection += 1
            genreSelectionArray = genreSelectionArray.filter {$0 != genreArray[indexPath.row]}
        }
        
print(genreSelectionArray)
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
