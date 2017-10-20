//
//  GenreViewController.swift
//  MovieNight
//
//  Created by Taylor Smith on 10/16/17.
//  Copyright © 2017 Taylor Smith. All rights reserved.
//

import UIKit

class GenreViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var nextButton: UIButton!
    
    
    
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
        nextButton.isEnabled = false
        nextButton.alpha = 0.3
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
                
            
                self.makeGenreArray()
                
                OperationQueue.main.addOperation {
                    
                    self.tableView.reloadData()
                    
                }
                
                
            } else { print("nope") }
        }
    }
    
    
    
    // MARK: - Table view data source
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return genreStringArray.count
        
    }
    
 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "genreCell", for: indexPath) as! GenreViewCell
        
        let item = genreStringArray[indexPath.row]
        let currentGenre = genreArray[indexPath.row]
        
        cell.textLabel?.text = item
        
        if genreSelectionArray.contains(currentGenre) {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
        } else { cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection") }
        
        
     

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(genreStringArray[indexPath.row])
        
        let cell = tableView.cellForRow(at: indexPath) as! GenreViewCell
        print(indexPath)
        
        if cell.selectionMark.image == #imageLiteral(resourceName: "EmptySelection") && maxSelection != 0 {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "SelectedCircle")
            maxSelection -= 1
            genreSelectionArray.append(genreArray[indexPath.row])
            
        } else if cell.selectionMark.image == #imageLiteral(resourceName: "SelectedCircle") {
            
            cell.selectionMark.image = #imageLiteral(resourceName: "EmptySelection")
            maxSelection += 1
            genreSelectionArray = genreSelectionArray.filter {$0 != genreArray[indexPath.row]}
        }
        
        if maxSelection == 0 {
            nextButton.alpha = 1.0
            nextButton.isEnabled = true
        } else if maxSelection != 0 {
            nextButton.alpha = 0.30
            nextButton.isEnabled = false
        }
        
        print(genreSelectionArray)
    }
    
    
    
    
}

