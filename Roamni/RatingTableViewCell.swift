//
//  RatingTableViewCell.swift
//  Roamni
//
//  Created by Hyman Li on 21/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit

class RatingTableViewCell: UITableViewCell {

    @IBOutlet weak var rateSegment: UISegmentedControl!
    override func awakeFromNib() {
        super.awakeFromNib()
        (rateSegment.subviews[0] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        (rateSegment.subviews[1] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        (rateSegment.subviews[2] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        // Initialization code
    }
    
    @IBAction func ratingSegmentControl(_ sender: Any) {
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
