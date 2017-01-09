//
//  NearbyViewController.swift
//  Roamni
//
//  Created by Hyman Li on 4/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit

class NearbyViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    
    override func viewWillAppear(_ animated: Bool) {
       // self.tableView.dataSource = self
       // self.tableView.delegate = self
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async(execute: { () -> Void in
            self.tableView.reloadData()

        })
        
        
    }
    
    
    
    @IBOutlet weak var tableView: UITableView!
    

    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 2 // your number of cell here
        switch(section)
        {
        case 0: return 1
        case 1: return 1
        case 2: return 1
        case 3: return 1
        case 4: return 1
        case 5: return 1
        case 6: return 1
        case 7: return 1
        case 8: return 1
        default: return 0
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int{
        // #warning Incomplete implementation, return the number of sections
        return 9
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.0000001
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
       
        if indexPath.section == 0{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 1{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 2{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 3{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 4{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 5{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 6{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 7{
            return 50.0//Choose your custom row height
        }
        if indexPath.section == 8{
            return 50.0//Choose your custom row height
        }

        
        return 50.0
    }
    
    
    
    //This function returns a cell for a table view, the returned object is of
    //type UITableViewCell. These are the objects that users see in the table's rows.
    //This function basically returns a cell, for a table view.
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        if indexPath.section == 0{
            //Return the cell with identifier NotificationTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "WalkingTableViewCell", for: indexPath as IndexPath) as! WalkingTableViewCell
            return cell
        }
        else if indexPath.section == 1{
            //Return the cell with identifier BackTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "DrivingTableViewCell", for: indexPath as IndexPath) as! DrivingTableViewCell
            return cell
            
        }else if indexPath.section == 2{
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "CyclingTableViewCell", for: indexPath as IndexPath) as! CyclingTableViewCell
            return cell
            
            
        }else if indexPath.section == 3{
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath as IndexPath)
            as! ShopTableViewCell
            return cell
            
            
        }else if indexPath.section == 4{
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "RealEstateTableViewCell", for: indexPath as IndexPath)
            as! RealTableViewCell
            return cell
            
            
        }else if indexPath.section == 5{
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "AccTableViewCell", for: indexPath as IndexPath)
            as! AccTableViewCell
            return cell
            
            
        }else if indexPath.section == 6{
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "MoreTableViewCell", for: indexPath as IndexPath)
            as! MoreTableViewCell
            return cell
            
            
        }else if indexPath.section == 7{
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "RecomTableViewCell", for: indexPath as IndexPath)
            as! RecomTableViewCell
            return cell
            
            
        }else {
            //Return the cell with identifier AboutTableViewCell
            let cell = tableView.dequeueReusableCell(withIdentifier: "PreTableViewCell", for: indexPath as IndexPath)
            as! PreTableViewCell
            return cell
            
            
        }
    }
    
    // pass selected artwokr to detail view
     func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "searchSegue"
        {
            
            let indexPath = self.tableView.indexPathForSelectedRow!
            let controller: SearchViewController = segue.destination
                as! SearchViewController
           
            
                }
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //        if indexPath.section == 3{
                    performSegue(withIdentifier: "searchSegue", sender: self)
        //        }
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
