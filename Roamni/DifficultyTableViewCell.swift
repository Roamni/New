//
//  DifficultyTableViewCell.swift
//  Roamni
//
//  Created by Hyman Li on 21/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit

class DifficultyTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        (difficultySegment.subviews[0] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        (difficultySegment.subviews[1] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        (difficultySegment.subviews[2] as UIView).tintColor = UIColor(red: 103.0/255.0, green: 65.0/255.0, blue: 114.0/255.0, alpha: 1.0)

    }

    @IBOutlet weak var difficultySegment: UISegmentedControl!
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
