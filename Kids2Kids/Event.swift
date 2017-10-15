//
//  Event.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 04.10.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import Foundation
import UIKit

class Event {
    
    var nameOfEvent: String
    var dateOfEvent: String
    var placeOfEvent: String
    var descriptionOfEvent: String
    var imageOfEvent: UIImage
    var fblinkOfEvent: String
    var numberOfEvent: Int
    init(nameOfEvent: String, dateOfEvent: String, placeOfEvent: String, descriptionOfEvent: String, imageOfEvent: UIImage, fblinkOfEvent: String, numberOfEvent: Int) {
        self.nameOfEvent = nameOfEvent
        self.dateOfEvent = dateOfEvent
        self.placeOfEvent = placeOfEvent
        self.descriptionOfEvent = descriptionOfEvent
        self.imageOfEvent = imageOfEvent
        self.fblinkOfEvent = fblinkOfEvent
        self.numberOfEvent = numberOfEvent
    }
}
