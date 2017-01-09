//
//  Tour.swift
//  Roamni
//
//  Created by Hyman Li on 9/1/17.
//  Copyright © 2017 ROAMNI. All rights reserved.
//

import Foundation
import CoreLocation

struct Tour {
    let category : String
    let name : String
    let locations : [CLLocation]
    let desc : String
}
