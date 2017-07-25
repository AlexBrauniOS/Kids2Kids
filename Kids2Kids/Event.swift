//
//  Event.swift
//  Kids2Kids
//
//  Created by Oleksii Liubarets on 24.07.17.
//  Copyright © 2017 Oleksii Liubarets. All rights reserved.
//

import Foundation
import UIKit

class Event {
    
    let nameOfEvent: String
    let imageOfEvent: UIImage
    let dateOfEvent: String
    let placeOfEvent: String
    let descriptionOfEvent: String
    
    init(nameOfEvent: String, imageOfEvent: UIImage, dateOfEvent: String, placeOfEvent: String, descriptionOfEvent: String) {
        self.nameOfEvent = nameOfEvent
        self.imageOfEvent = imageOfEvent
        self.dateOfEvent = dateOfEvent
        self.placeOfEvent = placeOfEvent
        self.descriptionOfEvent = descriptionOfEvent
    }
}
