//
//  SearchContainerViewController.swift
//  Roamni
//
//  Created by Hyman Li on 18/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit
import CoreLocation

class SearchContainerViewController: UIViewController {

    var container: ContainerViewController!
    var tourCategory : String?
    @IBOutlet weak var swtichBtn: UIBarButtonItem!
    var detailViewController: DetailViewController? = nil
    var getTableVCObject : ContainerTableViewController?
    var getMapVCObject : ContainerMapViewController?
    var tours = [Tour]()
    var filteredTours = [Tour]()
    var finalTours = [Tour]()
    let searchController = UISearchController(searchResultsController: nil)
    
    
    override func viewDidAppear(_ animated: Bool) {
        //clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
        print(self.tourCategory!)
        getTableVCObject?.tourCategory = self.tourCategory
        tours = [
            Tour(category:"walking", name:"Melbourne Central",locations:CLLocationCoordinate2D(latitude: -37.8426083, longitude: 144.9685646), desc: "This is a great"),
            Tour(category:"walking", name:"Victoria Gallery",locations:CLLocationCoordinate2D(latitude: -35.8426083, longitude: 142.9685646), desc: "This is a great"),
            Tour(category:"driving", name:"The Great Ocean Road",locations:CLLocationCoordinate2D(latitude: -37.8426083, longitude: 142.9685646), desc: "This is a great"),
            Tour(category:"cycling", name:"Yarra Valley",locations:CLLocationCoordinate2D(latitude: -37.6426083, longitude: 144.9665646), desc: "This is a great"),
            Tour(category:"shopping", name:"DFO",locations:CLLocationCoordinate2D(latitude: -37.8426083, longitude: 143.9685646), desc: "This is a great"),
            Tour(category:"realestate", name:"South Yarra",locations:CLLocationCoordinate2D(latitude: -37.26083, longitude: 144.9685646), desc: "This is a great"),
            Tour(category:"access", name:"Federation Square",locations:CLLocationCoordinate2D(latitude: -37.846083, longitude: 144.965646), desc: "This is a great"),
            Tour(category:"more", name:"Sour Chew",locations:CLLocationCoordinate2D(latitude: -37.8426083, longitude: 140.965646), desc: "This is a great"),
            Tour(category:"premium", name:"Eureka Tower Melbourne",locations:CLLocationCoordinate2D(latitude: -37.26083, longitude: 143.9685646), desc: "This is a great")]
            finalTours = tours
            getTableVCObject?.tours = self.tours
            getTableVCObject?.tableView.reloadData()


    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tourCategory = "currentLocation"
        container!.segueIdentifierReceivedFromParent("first")
        // Setup the Search Controller
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        definesPresentationContext = true
        searchController.dimsBackgroundDuringPresentation = false
        
        // Setup the Scope Bar
        searchController.searchBar.scopeButtonTitles = ["Default", "Rating", "Length"]
        getTableVCObject = self.container.currentViewController as? ContainerTableViewController
        getTableVCObject?.tableView.tableHeaderView = searchController.searchBar
        
        if let splitViewController = splitViewController {
            let controllers = splitViewController.viewControllers
            print(controllers.count)
            
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController

        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func test(_ sender: Any) {
        print("caocaocaocao")
        //container!.segueIdentifierReceivedFromParent("first")
        if self.swtichBtn.image == UIImage(named: "map"){
            self.swtichBtn.image = UIImage(named: "list")
            container!.segueIdentifierReceivedFromParent("second")
             getMapVCObject = self.container.currentViewController as? ContainerMapViewController
             getMapVCObject?.tours = finalTours
        }else{
            self.swtichBtn.image = UIImage(named: "map")
            container!.segueIdentifierReceivedFromParent("first")
        }
        
    }


    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "container"{
            
            container = segue.destination as! ContainerViewController

        }
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("hello!!")
        searchController.isActive = false
        //searchController.dismissViewControllerAnimated()
        getTableVCObject?.tours = finalTours
        getTableVCObject?.filteredTours = finalTours
        getTableVCObject?.tableView.reloadData()
        
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "Default") {
        filteredTours = tours.filter({( tour : Tour) -> Bool in
            let categoryMatch = (scope == "Default") || (tour.category == scope)
            return categoryMatch && tour.name.lowercased().contains(searchText.lowercased())
            print(filteredTours)

        })
        print("search box is clicked!")
        
        print("the tours are \(filteredTours)")
        if filteredTours.count == 0{
            getTableVCObject?.tours = tours
            getTableVCObject?.filteredTours = tours
            getTableVCObject?.tableView.reloadData()
            
        }else{
            getTableVCObject?.tours = filteredTours
            getTableVCObject?.filteredTours = filteredTours
            getTableVCObject?.tableView.reloadData()
            finalTours = filteredTours
            
        }
        //let getTableVCObject = self.container.currentViewController as? ContainerTableViewController
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

    extension SearchContainerViewController: UISearchBarDelegate {
        // MARK: - UISearchBar Delegate
        func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
            filterContentForSearchText(searchBar.text!, scope: searchBar.scopeButtonTitles![selectedScope])
        }
}

    extension SearchContainerViewController: UISearchResultsUpdating {
        // MARK: - UISearchResultsUpdating Delegate
        func updateSearchResults(for searchController: UISearchController) {
            let searchBar = searchController.searchBar
            let scope = searchBar.scopeButtonTitles![searchBar.selectedScopeButtonIndex]
            filterContentForSearchText(searchController.searchBar.text!, scope: scope)
        }
}




