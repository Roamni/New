//
//  SearchListTableViewController.swift
//  Roamni
//
//  Created by Hyman Li on 5/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit
import CoreLocation
import Firebase

class SearchListTableViewController: UITableViewController{
    
    // MARK: - Properties
    var detailViewController: DetailViewController? = nil
    var tours = [Tour]()
    var filteredTours = [Tour]()
    let searchController = UISearchController(searchResultsController: nil)
    
    // MARK: - View Setup
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTours()
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["Default", "Rating", "Length"]
        tableView.tableHeaderView = searchController.searchBar
        
//        tours = [
//            Tour(category:"walking", name:"Melbourne Central",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"walking", name:"Victoria Gallery",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"driving", name:"The Great Ocean Road",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"cycling", name:"Yarra Valley",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"shopping", name:"DFO",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"realestate", name:"South Yarra",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"access", name:"Federation Square",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"more", name:"Sour Chew",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great"),
//            Tour(category:"premium", name:"Eureka Tower Melbourne",locations:[CLLocation(latitude: -56.6462520, longitude: -36.6462520)], desc: "This is a great")]
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            print(controllers.count)

            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
    }
    
    func fetchTours(){
        var ref:FIRDatabaseReference?
        ref = FIRDatabase.database().reference()
        
        ref?.child("tours").observe(.childAdded, with:{ (snapshot) in
            let dictionary = snapshot.value as!  [String : Any]
           // tour.setValuesForKeys(dictionary)
            let location = dictionary["StartPoint"] as!  [String : Any]
            let tour = Tour(category:dictionary["TourType"] as! String, name:dictionary["Name"] as! String,locations:[CLLocation(latitude:location["lat"] as! CLLocationDegrees, longitude: location["lon"] as! CLLocationDegrees)], desc: dictionary["desc"] as! String)
            //            tour.Price = dictionary["Price"] as! String?
            //            tour.Star = dictionary["Star"] as! String?
            //            tour.StartPoint = dictionary["StartPoint"] as! String?
            //            tour.Time = dictionary["Time"] as! String?
            //            tour.TourType = dictionary["TourType"] as! String?
            //            tour.WholeTour = dictionary["WholeTour"] as! String?
            print(tour)
            self.tours.append(tour)
            
            //self.artworks.removeAll()
            DispatchQueue.main.async(execute: {self.tableView.reloadData() } )
            
        })
        { (error) in
            print(error.localizedDescription)
        }
    
    
    
    }
    override func viewWillAppear(_ animated: Bool) {
       // clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Table View
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredTours.count
        }
        return tours.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let tour: Tour
        if searchController.isActive && searchController.searchBar.text != "" {
            tour = filteredTours[indexPath.row]
        } else {
            tour = tours[indexPath.row]
        }
        cell.textLabel!.text = tour.name
        cell.detailTextLabel!.text = tour.category
        return cell
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        filteredTours = tours.filter({( tour : Tour) -> Bool in
            let categoryMatch = (scope == "All") || (tour.category == scope)
            return categoryMatch && tour.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    
    // MARK: - Segues
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let tour: Tour
                if searchController.isActive && searchController.searchBar.text != "" {
                    tour = filteredTours[indexPath.row]
                } else {
                    tour = tours[indexPath.row]
                }
                let controller = segue.destination as! DetailViewController
                controller.detailTour = tour
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
    
}

    
    extension SearchListTableViewController: UISearchBarDelegate {
        // MARK: - UISearchBar Delegate
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        }
    }
    
    extension SearchListTableViewController: UISearchResultsUpdating {
        // MARK: - UISearchResultsUpdating Delegate
        func updateSearchResults(for searchController: UISearchController) {
            let searchBar = searchController.searchBar
            let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            filterContentForSearchText(searchController.searchBar.text!, scope: scope)
        }
        


    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

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
