//
//  LengthTableViewCell.swift
//  Roamni
//
//  Created by Hyman Li on 21/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit

class LengthTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        (lengthSegment.subviews[0] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        (lengthSegment.subviews[1] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        (lengthSegment.subviews[2] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        // Initialization code
    }
    @IBOutlet weak var lengthSegment: UISegmentedControl!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
