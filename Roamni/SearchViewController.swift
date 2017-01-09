//
//  SearchViewController.swift
//  Roamni
//
//  Created by Hyman Li on 5/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class SearchViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        
        self.locationManager.delegate = self
        
        
        
        // Ask user for permission to use location
        // Uses description from NSLocationAlwaysUsageDescription in Info.plist
        locationManager.requestAlwaysAuthorization()
        
        
        self.mapView.showsUserLocation = true
        
        
        mapView.showsUserLocation = true
        
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
        self.mapView.showsUserLocation = true


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func gotoList(_ sender: Any) {
        print("yesyes")
         performSegue(withIdentifier: "listSegue", sender: self)
    }

    
    // pass selected artwokr to detail view
    func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "listSegue"
        {
            
            let controller: SearchListTableViewController = segue.destination
                as! SearchListTableViewController
            
            
        }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
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
