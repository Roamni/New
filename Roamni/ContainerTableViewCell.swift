//
//  ContainerTableViewCell.swift
//  Roamni
//
//  Created by Zihao Wang on 26/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import UIKit

class ContainerTableViewCell: UITableViewCell {
    @IBOutlet weak var StarLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
