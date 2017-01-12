//
//  FilterViewController.swift
//  Roamni
//
//  Created by zihaowang on 10/01/2017.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {

    @IBOutlet weak var RatingSeg: UISegmentedControl!
    @IBOutlet weak var LengthSeg: UISegmentedControl!
    @IBOutlet weak var DifficultSeg: UISegmentedControl!
    @IBAction func SearchButton(_ sender: Any) {
        let ratings:String = RatingSeg.titleForSegment(at: RatingSeg.selectedSegmentIndex)!
        let length:String = LengthSeg.titleForSegment(at: LengthSeg.selectedSegmentIndex)!
        let difficulty:String = DifficultSeg.titleForSegment(at: DifficultSeg.selectedSegmentIndex)!
        print(ratings+length+difficulty)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
